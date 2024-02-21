from shareplum import Site, Office365
from shareplum.site import Version


# SharePoint 用户名和密码
sharepointUsername = "toddy.zhou-ext@kering.com"
sharepointPassword = "K@ring96828"

# SharePoint 网站的URL
website = "https://kering.sharepoint.com"
# SharePoint 文档库的URL
sharepointSite = "https://kering.sharepoint.com"

# SharePoint 文档库
library_name = "Document Library/KE – DIGITAL WARRANTY CARD BI"
# sharepoint_directory: ["User Folder", "Archive Folder", "test folder"]

try:
    # 首先进行身份验证并获取 SharePoint 网站的授权 cookie
    authcookie = Office365(
        website, username=sharepointUsername, password=sharepointPassword
    ).GetCookies()
    print(f"Auth cookie: {authcookie}")
    print("1")
    site = Site(sharepointSite, version=Version.v365, authcookie=authcookie)
    print("2")
    # 输出网站的标题和描述
    print(f"SharePoint:{site.site_url}")
    print("SharePoint连接成功!")
    print("site.version")


except Exception as e:
    print(f"SharePoint连接或认证失败：{e}")


folder_name = "test Folder"
print(folder_name)

folder_path = f"{library_name}/{folder_name}"

# 创建 Folder 对象
folder_all = site.Folder(folder_path)
print("sharepoint_directory:", folder_all.folders)
# 获取files字典
file_dictionary = folder_all.files

file_names = [file_info["Name"] for file_info in file_dictionary]
print("sharepoint_file_list()已经获取数据文件列表!", file_names)
