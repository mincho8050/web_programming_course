<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03_배열.jsp</title>
</head>

<style>
	table{
		border-collapse: collapse;
	}
	th{
		background-color: #ff8080;
	}
	.best{
		color: red;
		font-weight: bold;
	}
</style>

<body>

	<h1>성적프로그램(배열)</h1>
	
	<%
	String[] name={"아이린","슬기","조이","예리","웬디"};
	int[] kor={100,35,75,95,85};
	int[] eng={100,40,80,95,90};
	int[] mat={95,50,60,35,85};
	int[] aver=new int[5];
	int[] rank={1,1,1,1,1};
	int size=name.length;
	
	//1)평균 구하기
	for(int a=0;a<size;a++){
    	aver[a]=(kor[a]+eng[a]+mat[a])/3;   	
	}//for
	
	//2)등수 구하기(평균 구하기)
	for(int a=0;a<size;a++){
	    for(int b=0;b<size;b++){
	        if(aver[a]<aver[b]){
	            rank[a]++;
	        }
	    }
	}//for	
	%>
	
	<!-- 출력하기 -->
	<table border="1">
		<tr>
			<th>이름</th>
			<th>국어</th>
			<th>영어</th>
			<th>수학</th>
			<th>평균</th>
			<th>등수</th>
			<th>결과</th>
			<th>장학여부</th>
		</tr>
		<%
			for(int idx=0; idx<size; idx++){
		%> 
		<!-- html공간 : 이렇게 중간중간 활성화를 시킬 수 있다.
			<tr></tr>이 다섯번 반복된다.
		-->
			<tr>
				<td><%=name[idx]%></td>
				<td><%=kor[idx]%></td>
				<td><%=eng[idx]%></td>
				<td><%=mat[idx]%></td>
				<td><%=aver[idx]%></td>
				<td><%=rank[idx]%></td>
				
				<td>
				<%
					//과락과목
				    if(aver[idx]>=70){
				        if(kor[idx]<40||eng[idx]<40||mat[idx]<40){
				            out.print("재시험");
				        }else{
				        	out.print("합격");
				        }		            
				    }else{
				    	out.print("불합격");
				    }//if
				    //10점당 별 한개씩
					for(int b=0;b<(aver[idx]/10);b++){
				        out.print("★");
				    }//for
				%>
				</td>
				<td class="best">
					<%
						//평균 95점 이상은 장학생 (글자는 진하고, 빨간색)
						if(aver[idx]>=95){
					        out.print(" 장학생");
					    }
					%>
				</td>
			</tr>				
		<%
			}//for
		%>
	</table>
	
	
	

</body>
</html>