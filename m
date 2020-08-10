Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.52])
 by mx.groups.io with SMTP id smtpd.web12.49926.1597080789958996580
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 10 Aug 2020 10:33:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=WMF2EU3W;
 spf=pass (domain: arm.com, ip: 40.107.22.52, mailfrom: prabin.ca@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EImfiF1AmWv3LepIO4N/xvtQvd3Y5di3zHfSL43ktJc=;
 b=WMF2EU3WAM21SAvkHjcngAe6e+O7XkiqhA8HHiMCim9lYJpXrkkAXga5A4heivKtgAZgYyvvSiIrOPxGkYTta5i575jLtuAnTWyCeV/ZYjDNzJR5XXHOHMXQirnFFbiAUa6nbI+OPZQUoMI7j5tk91AuX6MgRo402PaRXcH7iwE=
Received: from DB6P195CA0013.EURP195.PROD.OUTLOOK.COM (2603:10a6:4:cb::23) by
 HE1PR08MB2876.eurprd08.prod.outlook.com (2603:10a6:7:2b::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.20; Mon, 10 Aug 2020 17:33:07 +0000
Received: from DB5EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:cb:cafe::5e) by DB6P195CA0013.outlook.office365.com
 (2603:10a6:4:cb::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18 via Frontend
 Transport; Mon, 10 Aug 2020 17:33:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT051.mail.protection.outlook.com (10.152.21.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Mon, 10 Aug 2020 17:33:07 +0000
Received: ("Tessian outbound e8cdb8c6f386:v64"); Mon, 10 Aug 2020 17:33:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: adcacc7572013ac7
X-CR-MTA-TID: 64aa7808
Received: from 531d8f4c801b.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D8FD1BAD-9BDD-4ADE-B5C5-B08B6667B3A1.1;
	Mon, 10 Aug 2020 17:33:01 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 531d8f4c801b.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 10 Aug 2020 17:33:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NjM0x697s/1Jy3Y3B6bImeVeDoQfL2fgAfXLIZ93JTqU7bC40UuSzDyqVfzKqYG2E5o/mnwoIElrAu7jF//ji8mLF3pHSbCHT3117m9i+nXDPkzkh7YMl+/+l0s/inzGNLpnhadtSWf8WQLUM3Aa24Pn9nZ6zc/BXamYjyMYVdNp+k5UDHq6OcIRHKVa/OLhdiq+9h2B8DEljxXWOyBihV+1KztpfPRo1pVxuopAOwyY005AS2aAOyUUAx0OvvwgxSJP2b10oeCbWK6zib3yDRDgUI2UM3FPnJhgazg37Y2nGaN0JQQW7dHh1SB2FZdYS58JuAAokFOHVE7C1Ug3Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EImfiF1AmWv3LepIO4N/xvtQvd3Y5di3zHfSL43ktJc=;
 b=eTXo2fuzhpbljJ9Ymn6A3vQvIysOVfbzlm0upWsyPxw7R+z9pSFwZOxy4/j5L2LLvYkmQueT8XLuAj1QV33+4egjF4E4lUt3IeBAREHNiKnvkebT4sCV1HeaYUp799+8IyTTT23XwKA+anye7XbV3HtzHeAz3J8ZD85kwCM33xVO1GcnXpr2OVAgi6i+W6dSdk7xeoWZ/Tyn4YcMITG6ii0SKSQyA2G3vFcZGM8I4FQ/bFo0175id4UqJc0HwquPOP28WvgUEiREQBj4glPrUByvaqoM0tOjkarARHVtkaRExKIbd73Yv1i8pJjX06jC/HpqHo4JFCoCESnPI2kW5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EImfiF1AmWv3LepIO4N/xvtQvd3Y5di3zHfSL43ktJc=;
 b=WMF2EU3WAM21SAvkHjcngAe6e+O7XkiqhA8HHiMCim9lYJpXrkkAXga5A4heivKtgAZgYyvvSiIrOPxGkYTta5i575jLtuAnTWyCeV/ZYjDNzJR5XXHOHMXQirnFFbiAUa6nbI+OPZQUoMI7j5tk91AuX6MgRo402PaRXcH7iwE=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM4PR08MB2756.eurprd08.prod.outlook.com (2603:10a6:205:c::33)
 by AM0PR08MB5409.eurprd08.prod.outlook.com (2603:10a6:208:183::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18; Mon, 10 Aug
 2020 17:33:01 +0000
Received: from AM4PR08MB2756.eurprd08.prod.outlook.com
 ([fe80::6cc3:86b5:f5b3:89d5]) by AM4PR08MB2756.eurprd08.prod.outlook.com
 ([fe80::6cc3:86b5:f5b3:89d5%7]) with mapi id 15.20.3261.024; Mon, 10 Aug 2020
 17:33:01 +0000
From: "Prabin CA" <prabin.ca@arm.com>
To: meta-arm@lists.yoctoproject.org
CC: nd@arm.com,
	Prabin CA <prabin.ca@arm.com>
Subject: [PATCH 6/7] arm-bsp/wic: Introduce WIC support for sgi575
Date: Mon, 10 Aug 2020 23:02:15 +0530
Message-ID: <20200810173216.10411-6-prabin.ca@arm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200810173216.10411-1-prabin.ca@arm.com>
References: <20200810173216.10411-1-prabin.ca@arm.com>
X-ClientProxiedBy: BMXPR01CA0015.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:d::25) To AM4PR08MB2756.eurprd08.prod.outlook.com
 (2603:10a6:205:c::33)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from a076760.blr.arm.com (217.140.105.53) by BMXPR01CA0015.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:d::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Mon, 10 Aug 2020 17:33:00 +0000
X-Mailer: git-send-email 2.28.0
X-Originating-IP: [217.140.105.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c55d47f8-eef7-49f5-12e8-08d83d53719e
X-MS-TrafficTypeDiagnostic: AM0PR08MB5409:|HE1PR08MB2876:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<HE1PR08MB2876352DFA7CD8E73070E9FEE1440@HE1PR08MB2876.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: JPOMjLGmiYqcmzjI0Ji4EwfKdhgGGHU1fV8UvxkY3O/tuy81wC7/IQAxJBwrfDl3Y95Cr528na2eByzRDw8O+4LsWtODQjsgmHhItpZKfhQhLgVZfBzw9G+2preBZH80YDAq8Bg/3vW/z8qEUl4iM3bxM2eiJfoyPtZh6THNoVp+j47LiGo2sVDyV50T8H/9Wr3/Z0QdE1YQG6IA08BI5Yd1wW8uwkKiHuuCpx1h2cIYyeL7RDCNnVDdsDGeeoSk3VLdSNS/+pUpQ1lh+8lo+hZNK8BmuLnlUGX7YZe7h/AK3+KFU2r9K+trsOJBdmS2RkQA+sTNqVolrk7nTTSU6w==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM4PR08MB2756.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(8936002)(66476007)(66556008)(66946007)(6666004)(26005)(6916009)(36756003)(52116002)(7696005)(2906002)(86362001)(1076003)(316002)(956004)(2616005)(5660300002)(4326008)(8676002)(16526019)(186003)(83380400001)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: Tdqs7ThCANw7f6EhDdhIg77WYgtC4zf2RJYTEuqpSgz1thCJCaKCnEmVGN6K0VQbOLqS7Ucc7IHev6p+PoVNv5lwll3PdiKGmfUg984Sd9SXahGU3911t/XjPkOp2qprITyAlx5Wz5jUgOU5NsX34JzEDzLjlsW0y3YFnQ7jdK2z98p14LFllh/4d2sdYbTsKP5wCF7mNSKYfczDAYKHlPFVVPARY8eS6jXGX7iFRwTTXx04UexB9F0dVJ6mg36kRB+7bTUTr2n0UJL5G2+ZmENXdH0+uD26exj86FyVeEvwOkppzu6Lw8XmzAvcLqsf8hgw6d1a9KbArS2bzdwTNX+Jlig/ioFxrPVe37lbFwKcWudu5Sq8Zar208NmJ/LbQ1OM/6uOgWfzX8cPE3P2rS4xlTHVvTlRw9Nfb6UmQLPhzJjMkJMFK2R2yhxAMgtgJW7mawuqhsk+oFHyjvkjfzDGM1fq/VGFyOXfClbhDaeUKrUojICltbnotOeoGtVpWC61EPoKCT5ay2CwzEfiEOzaicvo0WxQwX+9Gcc+TRAOGkZr8dvsoR2NdtsCjKu3mUoZ2mfo/Eqxp8EmX6Uw+uusaDUPVZOEZT+KM9rYAVi58f2kfJ6G9E7sRUvNLuarT8hs7DNzz8DJW7Kbn5/Htg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5409
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Prabin.CA@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	86c35045-d5bf-4666-85be-08d83d536e04
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XDYipvjqDncNBQ+KPZQ0lBZOVjtmy9X6eBjdnfKQ/7WNTVPdBSi5ZJkP6SEDiGZXJHrTLhH0Fjl9IQuGGJphRcEy1zHC8rXTxY67QClvUpOpML1HFNTlUsPA1bW6WdyldCI/yk4i5H6V/2D/M7GMp3tHmj7s4OG2VDTbonuwJvYC2cCHkYc9Waj76II+GxWyiEhOZIIXlusw3nYhSafYHCBX0SZ9bB0TegkEsnd42iy8LbWpyiRb/bVDGnUe5RIJk67JxnabvkWwJmvsrM/yvIyd3/RKPUk83ojBO6lZLqov14uaHotNiJ9Ib56Y4OYl1WVkV8A8cgLi/ERF377JyNh/lj+zOAwsRDPip4gpHlEkx4Owv2a3/8OZw5MT527S00DNNdtA0/c6ZHYVUZirVg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(39860400002)(136003)(376002)(396003)(46966005)(6486002)(47076004)(81166007)(186003)(8936002)(82310400002)(16526019)(6916009)(86362001)(2616005)(8676002)(83380400001)(956004)(82740400003)(26005)(4326008)(1076003)(316002)(70586007)(5660300002)(2906002)(7696005)(356005)(70206006)(478600001)(336012)(6666004)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2020 17:33:07.0620
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c55d47f8-eef7-49f5-12e8-08d83d53719e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2876
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

            - Add custom wks script for SGI575.
            - Add grub.cfg for SGI575
            - Add documentation for sgi575

Change-Id: I9d371426a1bd75b49f6fbc89e2f2c255d4b8c0ac
Signed-off-by: Prabin CA <prabin.ca@arm.com>
---
 meta-arm-bsp/conf/machine/sgi575.conf |  5 ++++-
 meta-arm-bsp/wic/sgi575-efidisk.wks   | 11 +++++++++++
 meta-arm-bsp/wic/sgi575-grub.cfg      |  9 +++++++++
 3 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/wic/sgi575-efidisk.wks
 create mode 100644 meta-arm-bsp/wic/sgi575-grub.cfg

diff --git a/meta-arm-bsp/conf/machine/sgi575.conf b/meta-arm-bsp/conf/mach=
ine/sgi575.conf
index a2e13be..f8ad7a0 100644
--- a/meta-arm-bsp/conf/machine/sgi575.conf
+++ b/meta-arm-bsp/conf/machine/sgi575.conf
@@ -26,4 +26,7 @@ SERIAL_CONSOLES =3D "115200;ttyAMA0"
 EFI_PROVIDER ?=3D "grub-efi"
 MACHINE_FEATURES +=3D "efi"
=20
-IMAGE_FSTYPES +=3D "cpio.gz"
+IMAGE_FSTYPES +=3D "cpio.gz wic"
+
+WKS_FILE ?=3D "sgi575-efidisk.wks"
+WKS_FILE_DEPENDS_append =3D " ${EXTRA_IMAGEDEPENDS}"
diff --git a/meta-arm-bsp/wic/sgi575-efidisk.wks b/meta-arm-bsp/wic/sgi575-=
efidisk.wks
new file mode 100644
index 0000000..d4c79d3
--- /dev/null
+++ b/meta-arm-bsp/wic/sgi575-efidisk.wks
@@ -0,0 +1,11 @@
+# short-description: Create an EFI disk image
+# long-description: Creates a partitioned EFI disk image that the user
+# can directly dd to boot media. Uses a custom grub.cfg file to configure =
the boot.
+
+part /boot --source bootimg-efi --sourceparams=3D"loader=3Dgrub-efi" --ond=
isk sda --label msdos --active --align 1024
+
+part / --source rootfs --ondisk sda --fstype=3Dext4 --label root --align 1=
024 --uuid=3D9c53a91b-e182-4ff1-aeac-6ee2c432ae94
+
+part swap --ondisk sda --size 44 --label swap1 --fstype=3Dswap
+
+bootloader --ptable gpt --configfile=3D"sgi575-grub.cfg" --timeout=3D5
diff --git a/meta-arm-bsp/wic/sgi575-grub.cfg b/meta-arm-bsp/wic/sgi575-gru=
b.cfg
new file mode 100644
index 0000000..a176389
--- /dev/null
+++ b/meta-arm-bsp/wic/sgi575-grub.cfg
@@ -0,0 +1,9 @@
+set debug=3D"loader,mm"
+set term=3D"vt100"
+set default=3D"0"
+set timeout=3D"1"
+
+menuentry 'Arm reference image boot on sgi575' {
+        linux /Image acpi=3Dforce console=3DttyAMA0,115200 ip=3Ddhcp root=
=3DPARTUUID=3D9c53a91b-e182-4ff1-aeac-6ee2c432ae94 rootwait verbose debug
+}
+
--=20
2.28.0

