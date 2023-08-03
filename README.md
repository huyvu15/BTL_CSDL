# BTL_CSDL

Giảng viên hướng dẫn: TS.Nguyễn Thị Thanh Huyền.

Theo quan sát và nhận thấy nhiều cửa hàng thuốc hàng đầu tại Việt Nam như Long
Châu, Pharmarcity, Tâm Việt, siêu thị thuốc Việt,... có hệ thống quản lý cửa hàng
chuyên nghiệp và bài bản, đảm bảo hoạt động kinh doanh hiệu quả và duy trì uy tín
trên thị trường. Tuy nhiên, vẫn có nhiều tiệm thuốc khác chưa chú trọng vào việc áp
dụng các công nghệ quản lý tiên tiến và phù hợp với kỷ nguyên internet đang bùng nổ.
Do tình trạng này, em đã quyết định chọn chủ đề "Quản lý hiệu thuốc" có tính ứng
dụng thực tiễn cao. Chủ đề này sẽ giúp cải thiện quản lý và phát triển hoạt động của
các cửa hàng thuốc, đồng thời mang lại trải nghiệm tốt hơn cho khách hàng.
# 1.1 Mục tiêu hệ thống
Hệ thống cơ sở quản lý cửa hàng thuốc vừa và nhỏ nhằm hỗ trợ quản lý mua bán
thuốc, lưu trữ thông tin về các loại thuốc, nhân viên, khách hàng, quản lý số lượng tồn
kho, cũng như theo dõi các giao dịch bán hàng. Đồng thời, hệ thống cần giúp tối ưu
hóa quy trình kinh doanh, đảm bảo cung cấp đủ thuốc khi có nhu cầu và giám sát hiệu
quả kinh doanh của cửa hàng.Các mục tiêu chính của hệ thống này là:
## 1. Hiệu suất cao: Tối ưu hóa thời gian truy xuất dữ liệu và xử lý các truy vấn phức
tạp một cách nhanh chóng. Điều này đảm bảo người dùng có thể truy cập thông tin
một cách thuận tiện và nhanh chóng.
## 2. Dễ bảo trì và mở rộng: Đảm bảo tính ổn định và đáng tin cậy của hệ thống trong
thời gian dài. Dễ dàng thêm mới các tính năng mở rộng hệ thống khi cần thiết.
## 3. Dễ sử dụng và thân thiện với người dùng: Đảm bảo tính đơn giản và dễ sử
dụng, giúp người dùng tương tác với dữ liệu một cách thuận tiện và hiệu quả.
## 4. Cung cấp báo cáo và thống kê liên tục: cập nhập cho người dùng các thông tin
về cửa hàng thuốc, trực quan hóa các thông tin từ số lượng sản phẩm đến doanh thu
dưới dạng dashboard.

Tóm lại, mục tiêu của hệ thống cơ sở dữ liệu được xây dựng bằng lý thuyết thiết kế là
tạo ra một nền tảng dữ liệu chất lượng cao, đáng tin cậy và đáp ứng đủ các yêu cầu của
tổ chức, giúp nâng cao hiệu suất làm việc và quản lý thông tin một cách hiệu quả.
# 1.2 Các quy trình nghiệp vụ
• Phân tích yêu cầu

• Tìm hiểu những khái niệm liên quan

• Liệt kê các bước thực hiện

• Triển khai

# 1.3 Xác định yêu cầu của hệ thống về dữ liệu
• Thông tin thuốc: lưu trữ tên thuốc, mã thuốc, công dụng, ngày sản xuất, ngày hết
hạn, giá bán, số lượng còn, nhà cung cấp

• Thông tin nhân viên: lưu trữ mã nhân viên, tên nhân viên, số điện thoại, gmail,
giới tính...

• Thông tin khách hàng: lưu trữ mã khách hàng, tên khách hàng, số điện thoại, giới
tính,...

• Thông tin hóa đơn: mã thuốc, số lượng thuốc trong hóa đơn, mã nhân viên, mã
khách hàng

• Thông tin nhà cung cấp: lưu thông tin của các nhà cung cấp của cửa hàng

• Thông tin danh mục: lưu thông tin các loại danh mục


# Các câu truy vấn

select * from khachhang;

select * from thuoc;

select * from chi_tiet_hoa_don;

select * from hoadon;

select * from nhacungcap;

select * from danhmuc;

-- 20 câu truy vấn

-- 1: lấy ra doanh thu của từng nhân viên trong cửa hàng

-- 2: Lấy ra tháng có doanh thu cao nhất 

-- 3: lấy ra các loại thuốc hết hạn đã bán cho khách hàng

-- 4: Hiển thị danh sách nhân viên

-- 5: Thống kê doanh số của cửa hàng theo từng năm

-- 6: Liệt kê các khách hàng sử dụng số điện thoại của nhà mạng viettel (đuôi gồm: 098, 091) 

-- 7: Trả về kết doanh thu tháng hiện tại, tháng trước đó và tháng tiếp theo mà mỗi khách hàng mang lại.

-- 8: Tìm các loại thuốc bán chạy nhất trong Tháng 2:

-- 9: Tìm tất cả hóa đơn và tổng số thuốc đã bán trong hóa đơn 

-- 10: Lấy thông tin tên nhà cung cấp và tổng số tiền thu được từ việc bán các thuốc còn lại của mỗi nhà cung cấp:

-- 11: Lấy ra loại thuốc đắt nhất trong cửa hàng

-- 12: Lấy ra thông tin khách hàng có hóa đơn cao nhất trong năm 2023

-- 13: Cho biết thông tin các loại thuốc chưa bán cho khách hàng nào 

-- 14: Lấy thông tin tất cả các thuốc được bán ra nhiều hơn 4 lần trong năm nay:

-- 15: Lấy ra những khách hàng mua các loại thuốc được nhập ở quảng ninh và thông tin nhà cung cấp tương ứng

-- 16: Tìm thông tin nhân viên có giao dịch với khách hàng 'Trần Văn Bình'

-- 17: liệt kê các nhà cung cấp thuốc trong 'Danh mục A'

-- 18: Đếm số lượng khách hàng theo từng giới tính


-- 19: Tính tổng số lượng thuốc trong từng danh mục và sắp xếp theo số lượng giảm dần

-- 20: Lấy thông tin về các danh mục có số lượng thuốc nhiều nhất

# Các chức năng trong chương trình
![](https://github.com/huyvu15/BTL_CSDL/blob/main/photo/chuc_nang.jpg)

# Thiết kế cơ sở dữ liệu thu được từ lược đồ
![](https://github.com/huyvu15/BTL_CSDL/blob/main/photo/dig-e.png)