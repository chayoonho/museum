package com.museum.util;

import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.museum.dto.RelicDto;

public class RelicXMLParsing
{
	// 인증키
	private String key = "bK8BXVCe0ukhuM5iE9Orw24dotjGlHZBCbmflaSF90PbNdq77zXiqIno3nV3jYdeNLTG5TS3p9NGv5brAQnDhg==";
	
	private String numOfRows = "10"; // 한 페이지 결과 수
	private String pageNo = "1"; // 페이지 번호
	
	private String parentCode = "PS01"; // 상위코드
	private String meseumCode = "PS01001001";
	
	private String requestUrl = "http://www.emuseum.go.kr/openapi/";
	
	String totalCount = null;
	
	public List<RelicDto> parseXML(Document doc)
	{
		List<RelicDto> listRelic = new ArrayList<RelicDto>();
		
		Element root = doc.getDocumentElement(); // root 구하기
		NodeList child = root.getChildNodes(); // 자식 노드 목록 get
		
		for(int i = 0; i < child.getLength(); i++)
		{
			Node node = child.item(i);
			
			if(node.getNodeType() == Node.ELEMENT_NODE)
			{ 
				Element ele = (Element)node;
				String nodeName = ele.getNodeName();
				
				if(nodeName.equals("totalCount"))
				{
					totalCount = ele.getChildNodes().item(0).getNodeValue();
				}
				else if(nodeName.equals("list"))
				{
					// list - data - item
					NodeList child2 = ele.getChildNodes();
					
					for(int a = 0; a < child2.getLength(); a++)
					{
						Node node2 = child2.item(a);
						
						if(node2.getNodeType() == Node.ELEMENT_NODE)
						{
							Element ele2 = (Element)node2;
							String nodeName2 = ele2.getNodeName();
							
							if(nodeName2.equals("data"))
							{
								NodeList child3 = ele2.getChildNodes();
								
								String id = null, nameKr = null, imgThumUriL = null, imgUri = null;
								String desc = null, nationalityName1 = null, materialCode = null, materialName1 = null;
								String purposeName1 = null, purposeName2 = null, purposeName3 = null, purposeName4 = null;
								String indexWord = null, museumName3 = null, relicNo = null;
								
								for(int b = 0; b < child3.getLength(); b++)
								{
									Node node3 = child3.item(b);
									
									if(node3.getNodeType() == Node.ELEMENT_NODE)
									{
										Element ele3 = (Element)node3;
										String strAttr = ele3.getAttribute("key");
										
										if(strAttr.equals("id"))
										{
											id = ele3.getAttribute("value");
										}
										else if(strAttr.equals("imgUri"))
										{
											imgUri = "https://" + ele3.getAttribute("value");
										}
										else if(strAttr.equals("imgThumUriL"))
										{
											imgThumUriL = "https://" + ele3.getAttribute("value");
										}
										else if(strAttr.equals("nameKr"))
										{
											nameKr = ele3.getAttribute("value");
										}
										else if(strAttr.equals("desc"))
										{
											desc = ele3.getAttribute("value");
										}
										else if(strAttr.equals("nationalityName1"))
										{
											nationalityName1 = ele3.getAttribute("value");
										}
										else if(strAttr.equals("materialCode"))
										{
											materialCode = ele3.getAttribute("value");
										}
										else if(strAttr.equals("materialName1"))
										{
											materialName1 = ele3.getAttribute("value");
										}
										else if(strAttr.equals("purposeName1"))
										{
											purposeName1 = ele3.getAttribute("value");
										}
										else if(strAttr.equals("purposeName2"))
										{
											purposeName2 = ele3.getAttribute("value");
										}
										else if(strAttr.equals("purposeName3"))
										{
											purposeName3 = ele3.getAttribute("value");
										}
										else if(strAttr.equals("purposeName4"))
										{
											purposeName4 = ele3.getAttribute("value");
										}
										else if(strAttr.equals("indexWord"))
										{
											indexWord = ele3.getAttribute("value");
										}
										else if(strAttr.equals("museumName3"))
										{
											museumName3 = ele3.getAttribute("value");
										}
										else if(strAttr.equals("relicNo"))
										{
											relicNo = ele3.getAttribute("value");
										}
									}
								}

								// 리스트에 추가
								listRelic.add(new RelicDto(id, nameKr, imgThumUriL, imgUri, desc, nationalityName1, 
										materialCode, materialName1, purposeName1, purposeName2, purposeName3, purposeName4, 
										indexWord, museumName3, relicNo, totalCount));
							}
						}
					}
				}
			}
		}
		
		return listRelic;
	}
	
	public List<RelicDto> viewRelic(String category, String searchType, String relicId, String pageNo, String searchName)
	{			
		if(searchType.equals("1"))
		{
			// 코드 목록 조회
			requestUrl += "code?serviceKey=" + key + "&numOfRows=" + numOfRows + "&pageNo=" + pageNo;
			requestUrl += "&parentCode=" + parentCode;
		}
		else if(searchType.equals("2"))
		{
			// 소장품 목록 조회
			requestUrl += "relic/list?serviceKey=" + key + "&numOfRows=" + numOfRows + "&pageNo=" + pageNo 
						+ "&meseumCode=" + meseumCode;
			
			if(category.equals("2"))
			{
				// 보물 목록 조회
				requestUrl += "&indexWord=보물";
			}
		}
		else if(searchType.equals("3"))
		{
			// 소장품 상세 조회
			requestUrl += "relic/detail?serviceKey=" + key + "&numOfRows=" + numOfRows + "&pageNo=" + pageNo;
			requestUrl += "&id=" + relicId;			
		}
		else if(searchType.equals("4"))
		{
			// 소장품 목록 검색
			requestUrl += "relic/list?serviceKey=" + key + "&numOfRows=" + numOfRows + "&pageNo=" + pageNo 
					+ "&meseumCode=" + meseumCode + "&name=" + searchName;
		
			if(category.equals("2"))
			{
				// 보물 목록 검색
				requestUrl += "&indexWord=보물";
			}
		}
		else
		{
			System.out.println("조회 값을 확인해주세요.");
			return null;
		}
		
		try
		{ 
			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			Document doc = dBuilder.parse(requestUrl);			
			
			List<RelicDto> listRelic = new ArrayList<RelicDto>();
			listRelic.clear();
			
			listRelic = parseXML(doc);
			
			return listRelic;
			
		}
		catch(Exception e)
		{ 
			System.out.println(e.getMessage()); 
		} 
		
		return null;
	}
}
