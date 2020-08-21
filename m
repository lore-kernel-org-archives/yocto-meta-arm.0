Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.53])
 by mx.groups.io with SMTP id smtpd.web12.133443.1598017866288437854
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Aug 2020 06:51:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ynn2D8hm;
 spf=pass (domain: arm.com, ip: 40.107.14.53, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yXxiLDc0XUWdBv+o25ogMLlv5aDC2GHUMNixmqXDXBA=;
 b=ynn2D8hmhn+6IOxURdzFBuSl4WBl+ixiD2RaJC5ANwN2MZmkKurTvAuxv7VwBGc886FpGqGEdnCd/hQWYIKFcOBB/GGDkCtXOspOPniaoqurUdKRqTpeTRo/lPaB6G+tX432fK8bi4Fkj/ObDR9pww3XBUrug28Zuo+uoRsxac8=
Received: from AM5PR0701CA0006.eurprd07.prod.outlook.com
 (2603:10a6:203:51::16) by VI1PR08MB3872.eurprd08.prod.outlook.com
 (2603:10a6:803:c3::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Fri, 21 Aug
 2020 13:51:03 +0000
Received: from VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:51:cafe::ee) by AM5PR0701CA0006.outlook.office365.com
 (2603:10a6:203:51::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.10 via Frontend
 Transport; Fri, 21 Aug 2020 13:51:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT026.mail.protection.outlook.com (10.152.18.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Fri, 21 Aug 2020 13:51:03 +0000
Received: ("Tessian outbound 7a6fb63c1e64:v64"); Fri, 21 Aug 2020 13:51:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 23df9dd85471dc93
X-CR-MTA-TID: 64aa7808
Received: from 216e83d29917.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B414544D-06B4-4CFD-884B-8A09E6A1960F.1;
	Fri, 21 Aug 2020 13:50:57 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 216e83d29917.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 21 Aug 2020 13:50:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=St5wufVLLQOg349L20FG49aAwZEARLPtSTmA/BIxzJqrpJedD/IoWg6zSjWHnQb/5/JWkI8yM2Xfzb2ny6qyeRGB0L5A9iA+BonRmGHbt7Kylf0ib53L3U5ndU6ajL/MOPGqwStKdetAjlpFg3a68C75wdQTv0E1vb1d/KUK6EtqC1nCNT1HpFs6gGhl9rh4hSze78L2cZNAgw+Gh4ramhjk4bovCbonGuWP3jZuAtRKYh1tAYRv4n8CObOmw4cRIkb1iMI+44XXr5Tn7/Z/eWEc9VUv+guzMpNj2sq9+vmYjAkn6epNjbQodWC6B6gwH12oRfOPZg0lXCsM7m8rrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yXxiLDc0XUWdBv+o25ogMLlv5aDC2GHUMNixmqXDXBA=;
 b=Bc0dg+DmZjftheEAo3nbZCuK+ddZqI9BrqWsYahUC3vwUZf/9dKxe+iZZzb/GGo+P54gCVpEVXzqZiQc+iBA7q2iwaaI6o4G61zp7CPnvs2R/mfSsTWAR2eJu3XvXzQyhK0QO3MffiWbYzA2jsfD0SH0PGVUDr83w24a4ouZ/mBZ0E0n+z9btQRauA/TwYdpj6JcGmjCz4yLKWivQbP/acMcJuLxMf4pSYO+gHJ10FpvP9mZJauN0Uj/gzaJoHde0vtzw3Ekt7Yb/kprdsUt+vgTmuSAGMJ3yKZDftfPaG6a6nHLPutBDN7OVMqfzTakLNVBUrDVFpdl8ZYFD9/PbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yXxiLDc0XUWdBv+o25ogMLlv5aDC2GHUMNixmqXDXBA=;
 b=ynn2D8hmhn+6IOxURdzFBuSl4WBl+ixiD2RaJC5ANwN2MZmkKurTvAuxv7VwBGc886FpGqGEdnCd/hQWYIKFcOBB/GGDkCtXOspOPniaoqurUdKRqTpeTRo/lPaB6G+tX432fK8bi4Fkj/ObDR9pww3XBUrug28Zuo+uoRsxac8=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com (2603:10a6:208:d4::18)
 by AM0PR08MB3412.eurprd08.prod.outlook.com (2603:10a6:208:dc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Fri, 21 Aug
 2020 13:50:55 +0000
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::11c:52aa:c2da:5ef]) by AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::11c:52aa:c2da:5ef%4]) with mapi id 15.20.3283.027; Fri, 21 Aug 2020
 13:50:55 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>
Subject: [PATCH 2/3] arm/trusted-firmware-a: add support to install dtb built as part of TFA
Date: Fri, 21 Aug 2020 19:20:23 +0530
Message-Id: <20200821135024.25615-2-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200821135024.25615-1-khasim.mohammed@arm.com>
References: <20200821135024.25615-1-khasim.mohammed@arm.com>
X-ClientProxiedBy: DM6PR08CA0047.namprd08.prod.outlook.com
 (2603:10b6:5:1e0::21) To AM0PR08MB3409.eurprd08.prod.outlook.com
 (2603:10a6:208:d4::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.96.140) by DM6PR08CA0047.namprd08.prod.outlook.com (2603:10b6:5:1e0::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend Transport; Fri, 21 Aug 2020 13:50:53 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.96.140]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 311f9804-349b-4ba4-ccd8-08d845d93e95
X-MS-TrafficTypeDiagnostic: AM0PR08MB3412:|VI1PR08MB3872:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB3872F018B09EEE5278D73B27FA5B0@VI1PR08MB3872.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 66WQgGsNgVltulMUokCLzlPG2jK7mdj1UCOF4F5vot+ffEZy1WEBUR7RmBYO+p65n7lloExXXhAPxVvBJ6rCPttVQ4J7ZAKH8Vn+PTAdp/uw4aojlTUMMHs0U44P/BbqZlcZm4ZozwBTujl7zgkfZaSOD6HWx3cZO3C85n4SM1a3NFnif3OYlh+59zOFHhWTN9gkVrF8EFRQjBjs5Nb3QTy5DBG07l8NsWShYGd6JKMTfisaeUtC3DtvD124kU51M7DiSLF2bnEtjBylYGQncpG3FC+WdtQwKFQFemAZejWVE34S3jIN0aNPUW5YTmuBzkmWwYUkQXs+57Sv3AilMw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3409.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(136003)(396003)(366004)(2906002)(8936002)(6486002)(316002)(83380400001)(6916009)(478600001)(6666004)(86362001)(1076003)(5660300002)(956004)(2616005)(16526019)(186003)(8676002)(26005)(36756003)(4326008)(52116002)(7696005)(66556008)(66476007)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 ZNaiDRqih3n3CI5761AbLkCB5JgN8FMsHP8hnOyYj5YBVhINPr9a7jyguWrG0Vk9Mqkx6X5GgFdZc4AWGJkj1D/eiJk8mZhYkhhjlhK5qDe4/ycrIZqj2+J5FtL8QDeFM2+QUo1buVfeYP1+h0xRf/YBwMO6M4aL3oSNs7wtMrQoYI8+UVQzdozNi9WIcEZnHAFT7UIKAWCb7Xfzd/ZEiPA+wnbq4eB1m/gyBaiQJi+iqOrmVSYEj55t3q6WJqwEV+MsDYtMa8qzclXGCppYlaHExjF6+oKjyG7Aj6PNO0km1I2l0eHwig/T5opy7NlUEMiW6JViRE9DKF6ROggw8HF44+8Dkspa79zrRW9l/rU5AaUTVFtgtH4zrTA+jlqlS/oEUAQjBvbv1OMUvaCni1pDglIiabj3J/CrHymQ3S819Fa/EyZa09XL6dmFg+3wMc55ysDli+pInAI/sF9TVcKVhqoNe50wEFmASejb1YbCatRjWqlCUjrHy/IDgJxuzoibtmap0AQ+za94cmbElTtt6n/BHY8LMPFs6XrCiCYiJireblPKss0S4vPm6crveqSbo4vmboEDlye775/yqiN36W5zS6PT7JzpaAIrMeQySEGmm13qHgkhXj/ehcZgyyeJ1DkP+SRO36B8mcszJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3412
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9a15b98a-420f-450a-6c38-08d845d939b1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	i/Ev+jZFFzr6IPvkqBjt6SkDdnAn1NH4HsrQeJIntmcGMgwwgqNxQcTreOOJur51SiM3AMOxW1YLp0uleFxO5nNm5UeNUXNh+7VyO5of0kYYr3hX1DUT+G2GTv5lKRMdXyCfg/TooykY2xNBFE1NnCIk258qVxEoWYiYV6n6KHmh4c59F+f4OitTvQLFrUF7aUV7v4xNubRrQ6+wSQa6g2Jwc8kq8YDPXGZEUqkq8Tms1KZiIDKED7n0FoU+HeavrzEbXu6TFU6C7YrwHANvQ29oFElqnXnwniChq5aKV6GeiiKnD7f0B7JZRPmlbDQS+hOaWni95GFope81cHYDuKW6g7sA9qBX/9o1zCIH6/aOqlKjQJlkrTOxnFSPaltoVMGWTXjnnx1R0MdDq4kg3g==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(346002)(136003)(46966005)(6916009)(4326008)(36906005)(6486002)(16526019)(186003)(47076004)(86362001)(36756003)(356005)(336012)(6666004)(8676002)(83380400001)(478600001)(316002)(81166007)(82310400002)(2906002)(82740400003)(26005)(956004)(1076003)(2616005)(7696005)(5660300002)(8936002)(70586007)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 13:51:03.2070
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 311f9804-349b-4ba4-ccd8-08d845d93e95
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3872
Content-Type: text/plain

Device tree blobs (DTBs) generated as part of TFA were installed separately
in the platform specific TFA recipes, its redundant as each platform was
executing similar installation steps.

The patch avoids skipping dtb installation and adds support to check for
DTB entries in TFA_INSTALL_TARGET and install the same to respective deploy folder.

Change-Id: I0f8f5c39dc4b4931d202696990fa915ea7ed60eb
Issue-Id: PLATFORMS-3971
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 .../trusted-firmware-a/trusted-firmware-a.inc          | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index e4847b5..82a886f 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -166,10 +166,14 @@ do_install() {
             ln -sf $atfbin-${TFA_PLATFORM} ${D}/firmware/$atfbin
             processes="1"
         fi
+        if [ -f ${BUILD_DIR}/fdts/$atfbin.dtb ]; then
+            echo "Install $atfbin.dtb"
+            install -m 0644 "${BUILD_DIR}/fdts/$atfbin.dtb" \
+                "${D}/firmware/$atfbin.dtb"
+            processes="1"
+        fi
 
-        if [ "$atfbin" = "dtbs" ]; then
-            echo "dtbs install, skipped"
-        elif [ -f ${B}/tools/$atfbin/$atfbin ]; then
+        if [ -f ${B}/tools/$atfbin/$atfbin ]; then
             echo "Tools $atfbin install, skipped"
         elif [ "$processes" = "0" ]; then
             bberror "Unsupported TFA_INSTALL_TARGET target $atfbin"
-- 
2.17.1

