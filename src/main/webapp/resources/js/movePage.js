function movePage(url, realPath){


    if(!(url != realPath+"/home.do" ^ url != realPath+"/")){    	
    
    	document.getElementById("topMenu").style.display = "block";
    	
         if(url.substring(0,10) == realPath+"/intro"){
            $("#menuPan").append(
               $("<h1>").text("스마트 팜 안내"),
               $('<br>'),
               $("<h3>").append(
                  $("<a>").attr("href", realPath+"/intro.do?intro_board_class=intro3").text("스마트 팜 안내"),
                  $("<span>").text(" | "),   
                  $("<a>").attr("href", realPath+"/introg.do?intro_board_class=intro2").text("과수 분야"),
                  $("<span>").text(" | "),
                  $("<a>").attr("href", realPath+"/intron.do?intro_board_class=intro1").text("노지 분야")
                  )
            )
         }
         else if(url.substring(0,11) == realPath+"/notice" || url.substring(0,13) == realPath+"/archieve"){
            $("#menuPan").append(
               $("<h1>").text("스마트 팜 알림"),
               $('<br>'),
               $("<h3>").append(
                  $("<a>").attr("href", realPath+"/notice.do").text("공지사항"),
                  $("<span>").text(" | "),   
                  $("<a>").attr("href", realPath+"/archieve.do").text("자료실")
                  )
            )
         }
         else if(url.substring(0,14) == realPath+"/plantShop" || url.substring(0,8) == realPath+"/kit"){
             $("#menuPan").append(
                $("<h1>").text("판매"),
                $('<br>'),
                $("<h3>").append(
                   $("<a>").attr("href", realPath+"/plantShopList.do").text("작물 판매"),
                   $("<span>").text(" | "),   
                   $("<a>").attr("href", realPath+"/kitShopList.do?kitPrpos=&orderBy=name").text("키트 판매")
                   )
             )
          }
         else if(url.substring(0,9) == realPath+"/aucn"){
             $("#menuPan").append(
                $("<h1>").text("경매"),
                $('<br>'),
                $("<h3>").append(
                   $("<a>").attr("href",realPath+"/aucnMain.do").text("경매")
                   )
             )
          }  
         //220308 PSH 이용후기 수정 예정
         else if(url.substring(0,9) == realPath+"/free" || url.substring(0,8) == realPath+"/use"){
              $("#menuPan").append(
                      $("<h1>").text("커뮤니티"),
                      $('<br>'),
                      $("<h3>").append(
                         $("<a>").attr("href", realPath+"/free.do").text("자유 게시판"),
                         $("<span>").text(" | "),   
                         $("<a>").attr("href", realPath+"/useRevwMain.do").text("이용 후기")
                         )
                   )
         }
         else if(url.substring(0,8) == realPath+"/qna" || url.substring(0,8) == realPath+"/faq"){
             $("#menuPan").append(
                     $("<h1>").text("고객지원"),
                     $('<br>'),
                     $("<h3>").append(
                        $("<a>").attr("href", realPath+"/qna.do").text("Qna"),
                        $("<span>").text(" | "),   
                        $("<a>").attr("href", realPath+"/faq.do").text("FAQ")
                        )
                  )
        }
         else if(url == realPath+"/grow.do" || url == realPath+"/howTo.do" || url == realPath+"/cctv.do" 
        		 || url == realPath+"/control.do" || url == realPath+"/sensor.do" || url == realPath+"/log.do"
        		 || url == realPath+"/diary.do"){
             $("#menuPan").append(
                     $("<h1>").text("컨트롤 페이지"),
                     $('<br>'),
                     $("<h3>").append(
                        $("<a>").attr("href", realPath+"/grow.do").text("재배 홈"),
                        $("<span>").text(" | "),   
                        $("<a>").attr("href", realPath+"/howTo.do").text("사용 법"),
                        $("<span>").text(" | "),   
                        $("<a>").attr("href", realPath+"/cctv.do").text("CCTV"),
                        $("<span>").text(" | "),   
                        $("<a>").attr("href", realPath+"/control.do").text("재배관리"),
                        $("<span>").text(" | "),   
                        $("<a>").attr("href", realPath+"/sensor.do").text("실시간 정보"),
                        $("<span>").text(" | "),   
                        $("<a>").attr("href", realPath+"/log.do").text("일별 로그"),
                        $("<span>").text(" | "),   
                        $("<a>").attr("href", realPath+"/diary.do").text("영농 일지")
                        )
                  )
        } 
         else if(url.substring(0,10) == realPath+"/admin"){
             $("#menuPan").append(
                     $("<h1>").text("관리자 페이지"),
                     $('<br>'),
                     $("<h3>").append(
                        $("<a>").attr("href", realPath+"/admin/adminHome.do").text("매출"),
                        $("<span>").text(" | "),   
                        $("<a>").attr("href", realPath+"/admin/adminPurchaseList.do").text("키트 구매 현황"),
                        $("<span>").text(" | "),
                        $("<a>").attr("href", realPath+"/admin/adminManageMember.do").text("회원관리"),
                        $("<span>").text(" | "),
                        $("<a>").attr("href", realPath+"/admin/adminManageKit.do").text("키트관리"),
                        $("<span>").text(" | "),
                        $("<a>").attr("href", realPath+"/admin/adminManageNFT.do").text("NFT 현황 조회")
                        )
                  )
        }
       
		
        
    }
   } 
    
var tempvalue= "abcd";