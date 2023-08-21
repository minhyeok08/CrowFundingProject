<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Option Selection</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }
    .container {
        max-width: 800px;
        margin: 0 auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }
    h2 {
        font-size: 24px;
        margin-bottom: 20px;
    }
    .option-box {
        border: 1px solid #ccc;
        border-radius: 8px;
        padding: 10px;
        margin-bottom: 20px;
        background-color: #fff;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
    .option-item {
        display: flex;
        align-items: center;
        margin-bottom: 10px;
    }
    .option-item label {
        flex: 1;
        font-weight: bold;
    }
    .option-item select {
        flex: 2;
        padding: 5px;
        border: 1px solid #ccc;
        border-radius: 4px;
        outline: none;
    }
    .submit-button {
        display: block;
        width: 100%;
        padding: 10px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 4px;
        font-size: 16px;
        cursor: pointer;
    }
    .submit-button:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
    <div class="container">
        <h2>상품 옵션 선택</h2>
        <div class="option-box">
            <div class="option-item">
                <label for="color">색상:</label>
                <select id="color" name="color">
                    <option value="red">빨강</option>
                    <option value="blue">파랑</option>
                    <option value="green">초록</option>
                </select>
            </div>
            <div class="option-item">
                <label for="size">사이즈:</label>
                <select id="size" name="size">
                    <option value="small">Small</option>
                    <option value="medium">Medium</option>
                    <option value="large">Large</option>
                </select>
            </div>
        </div>
        <button class="submit-button">선택 완료</button>
    </div>
</body>
</html>