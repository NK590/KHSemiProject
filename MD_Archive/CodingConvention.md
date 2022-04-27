### 프로젝트 협업을 위한 코딩 컨벤션

---

- 아래에 길게 써놨지만 사실 여태 수업에서 사용했던 방식과 크게 다르지 않습니다. 너무 코드가 더러워지지만 않는 정도로 신경쓰면 될 것 같습니다.

---

#### 1. 공통

- 선언하는 모든 변수, 메서드(함수), 클래스 등의 이름은 최소한 무슨 용도인지 이름만 보고도 어느 정도 파악하게끔 선언하여 최소한의 가독성을 유지함

```Java
public class Main {
    // 나쁜 예
    public static void method () {
        System.out.println("Hello, world!");
    }
    int a;
    String b;
    

    // 적절한 예
    public static void printHelloWorld () {
        System.out.println("Hello, world!");
    }
    int postLikeCount;
    String sqlQuery;
}
```

- 인덴트(들여쓰기)는 Tab키 상당(스페이스바 4칸)으로 통일 : IDE에서 따로 설정하지 않는 이상 대부분 기본 설정

- 모든 소스, 텍스트 문서 파일의 인코딩은 UTF-8로 통일 (윈도우-맥 환경에서의 충돌을 최소화)

- 한 줄에는 하나의 변수만 선언

```Java
// 나쁜 예
int height, weight;
String name, address;


// 적절한 예
int height;
int weight;
String name;
String address;
```

- 모든 중괄호 컨벤션은 K&R 스타일<sup>[1](#footnote_1)</sup>로 통일

```Java
// 나쁜 예
public class Main 
{
    public static void main(String[] args) 
    {
        System.out.println("Hello, world!");
    }
}


// 적절한 예
public class Main {
    public static void main(String[] args) {
        System.out.println("Hello, world!");
    }
}
```

---

#### 2. Java

- 클래스 이름은 가능하면 대문자로 시작하는 한 단어의 명사로 구성

- 메서드, 변수 이름은 소문자로 시작하는 Camel-Case<sup>[2](#footnote_2)</sup>로 구성

- 상수 이름은 전부 대문자와 언더스코어로 구성

```Java
// 나쁜 예
public class sample {};
public class sampleClass {};

pubilc static void print_hello_world() {};
pubilc static void print-hello-world() {};
pubilc static void printhelloworld() {};

public static int sql_query;

public static final int max-length;
public static final int maxLength;


// 적절한 예
public class Sample {};

public static void printHelloWorld() {};

public static int sqlQuery;

public static final int MAX_LENGTH;
```

---

#### 3. HTML/CSS

- 스타일링과 스크립팅은 가능하면 별도의 CSS 파일과 JS 파일을 작성하여 HTML 소스와 분리

- HTML 파일에서는 과도한 강제개행 지양

```HTML
<!-- 나쁜 예 -->
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>MyPage</title>
</head>

<body>

    <p>Hello, World!</p>

</body>

</html>


<!-- 적절한 예 -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MyPage</title>
</head>
<body>
    <p>Hello, World!</p>
</body>
</html>
```

- HTML/CSS의 클래스명, ID명 작명 시 Kebab-Case<sup>[2](#footnote_2)</sup>로 통일

```html
<!-- 나쁜 예 -->
<input type="text" class="inputText" id="first_input">


<!-- 적절한 예 -->
<input type="text" class="input-text" id="first-input">
```

- 외부 CSS파일과 JS 파일을 import할 때, CSS 파일을 JS 파일보다 위에서 불러올 것. 그리고 JS 파일은 body 요소의 가장 마지막에 가져올 것.

---

#### 4. JavaScript

- 자바스크립트는 코드 구문의 끝에 세미콜론을 붙이지 않아도 문제없이 작동하지만 통일감을 위해 반드시 세미콜론을 붙일 것

- 변수 선언 시 값이 바뀌지 않는 경우는 const, 바뀌는 경우는 let으로 선언. var의 사용은 되도록 지양할 것

- 콜백 지옥<sup>[3](#footnote_3)</sup>을 벗어나기 위한 다양한 노력을 할 것

---

<a name = "footnote_1">1</a> https://dpdpwl.tistory.com/54 참조

<a name = "footnote_2">2</a> https://yangbox.tistory.com/65 참조

<a name = "footnote_3">3</a> https://backback.tistory.com/319 참조