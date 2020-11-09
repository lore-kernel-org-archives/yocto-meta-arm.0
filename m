Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.44])
 by mx.groups.io with SMTP id smtpd.web11.11922.1604931075915052642
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 09 Nov 2020 06:11:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=7OBZEt0F;
 spf=pass (domain: arm.com, ip: 40.107.4.44, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5f1lONO96hTpRcu5k5FPywyC1YdGctR4QTr3X+TB/JY=;
 b=7OBZEt0FB3VtY/R9DzKG5LkeoB1okRFgx8xZcO662NVFGwcgCUfuAj/yxQSykyjqnw7bLsBX0MLoPxnEEFmJLUqL7N3xsCbts23hcZpojZvfAuoK/zXDBAuxlQzV3vLTjlhproYkohglujBo84hYVWy8prrN6WV/QySPUhk1EsM=
Received: from MR2P264CA0096.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:32::36)
 by AM7PR08MB5351.eurprd08.prod.outlook.com (2603:10a6:20b:dc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Mon, 9 Nov
 2020 14:11:13 +0000
Received: from VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:32:cafe::76) by MR2P264CA0096.outlook.office365.com
 (2603:10a6:500:32::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Mon, 9 Nov 2020 14:11:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=timeout (key query
 timeout) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT056.mail.protection.outlook.com (10.152.19.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Mon, 9 Nov 2020 14:11:09 +0000
Received: ("Tessian outbound 13ed5f5344c0:v71"); Mon, 09 Nov 2020 14:11:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4e1a7e6483163ce3
X-CR-MTA-TID: 64aa7808
Received: from dac7a39cab1e.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 46EF560B-C3FC-4356-B153-B4F35A5EBA54.1;
	Mon, 09 Nov 2020 14:10:51 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dac7a39cab1e.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 09 Nov 2020 14:10:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uz6+n2Ej9FYqIjcruxaBlNsTP6V9ErLFSM99/g/0NJuCEPJjjy4cwVPVqc3xbW4lulnHr3pJ6GHCh3CMOzQRuI3unvxCPKCR30uWNksJrngPASwGNP2bvrq5zbgdUa1Rz9MlkKgC/A60bjfsC+1GwyRxzsljvsdHOUeswQEzcNDhxP1P3dM2Go6PZdVpZ6MokbWROeiUfOzwQKO5aGiXJfmz3d5TbUzVYXxcankFBux61ftf4JQ/VmDrj+1SdMY8Czu6gruR4QUU6yYGlrc/cQ0IqtbA2Ea36jAZXXJMUFSTij79d13R+q/uwkv7HNhZl7EnOWkDa+2OSQHwckdaQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5f1lONO96hTpRcu5k5FPywyC1YdGctR4QTr3X+TB/JY=;
 b=a2DT/aGezGuKuPbnQvBWwU+u2F5FOvY/6rMH/TkMHGBipV5sB5MY2SuAdOZLkBjKbAdrgLo6Gfi43XNMWasCfq21ZCaafFC4xQcLLhPPyWEHlLAZVToIAJcNfzXXZwBublmZ+xkGrFayx7XN4O/pzPnkYmhG5WAbSZWgjvFFYo7U3rW0+fxl6h3ZoRF4CyKNsDRoceBUkwd0WLdeTMdGBftjJiAGJ+5yWQYVsJfpzEe1h2G5XaMUEm9Wf8X0nAVwsAVKw7Y0gtRhYE1EtLdVPzFbSai3t5dgJpz4mQDopFceWc63jVsUVNxVN0+I41ZkrgbrcRlSuxbXFypr9NR0tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5f1lONO96hTpRcu5k5FPywyC1YdGctR4QTr3X+TB/JY=;
 b=7OBZEt0FB3VtY/R9DzKG5LkeoB1okRFgx8xZcO662NVFGwcgCUfuAj/yxQSykyjqnw7bLsBX0MLoPxnEEFmJLUqL7N3xsCbts23hcZpojZvfAuoK/zXDBAuxlQzV3vLTjlhproYkohglujBo84hYVWy8prrN6WV/QySPUhk1EsM=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB3816.eurprd08.prod.outlook.com (2603:10a6:20b:8c::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Mon, 9 Nov
 2020 14:10:50 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf%6]) with mapi id 15.20.3499.032; Mon, 9 Nov 2020
 14:10:50 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH] arm-bsp/n1sdp: Add wic.gz and wic.bmap to IMAGE_FSTYPES
Date: Mon,  9 Nov 2020 14:10:46 +0000
Message-Id: <041a43d1a908d18a5eab982dcfc857c7f5f01b1b.1604931024.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.51]
X-ClientProxiedBy: LO2P265CA0501.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::8) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.51) by LO2P265CA0501.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:13b::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3541.21 via Frontend Transport; Mon, 9 Nov 2020 14:10:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bbb30ca1-6f4c-4edf-acf5-08d884b94e79
X-MS-TrafficTypeDiagnostic: AM6PR08MB3816:|AM7PR08MB5351:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM7PR08MB53517249E1EBF9CB8ACDE53A92EA0@AM7PR08MB5351.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:361;OLM:361;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 4g6oTL0UlV4DcP36/SFGZxp1dbvSp2nRX8T4YIbNfYHd5Ra6wr4LVqQvDpYQiW6OzCrgVxfcz/07VfEblao8imwyHomzXLFp/jsIBAO09f9zCHhrGY446BQTNalduQc/x1YhOTUgj/I+AzPQlwLpTH8ByGdGNlE7SF5lYMXL03lR33A06ozLrSIdImJmHYYNMs6DHv3NzFbD7NDnF73m5BuQeI/EZOUHcjM/OFlvSaGFEgOOmTHZ3wmjVzEu4H9QeMADnTlthoM30Yq8v5hSSUb502A9iS0lbG5qViYO32hkGxyVPFirRLIP+BHEa667
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39860400002)(376002)(366004)(396003)(6666004)(16526019)(83380400001)(8676002)(8936002)(66476007)(66946007)(66556008)(316002)(26005)(186003)(52116002)(956004)(2906002)(478600001)(7696005)(2616005)(4744005)(86362001)(6486002)(5660300002)(6916009)(4326008)(44832011)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 tatxC7eZfAT6JFoDpxSMNmWwz3Ej5VF+tPh0VmObYAxgRXViuPgTV/1878Mjc6lYXtGJHkK8Bb7jPFsvLaGBdWXcdBDOCVceT319Ub4cLIOx/jCi1ue/boPGGRRhKVWRnwwxfs1eP9tUvROX1CFB2AhGyJvUuRhO5prKrz2PrcjkCCmtBJLjp/ABkckwwrdRLMFe3Fprig8/xeZ3HsNjet6IC7SY3hHlezrAWUu4XEMQWKOEYZ3YgDM0vsNmpoc4YmmAaeq0hjxqRd0ZzvyaTzyq105u5jF5KOtc2ygBg7O8ytrix4tugbuU0dRZUFxMzYjbIqOEdxrJxzpdntb45Ag335EXQCmxmctfeLwKnqDAmsZ2eivx0pI0LhjPjsaDgKW7B4IXubiDWpn9TwTkQ3nIUhhHyQMSIr8M7KRn1anil6bZ94IPTy6ceZrvURewx0EJSCH4fqDluoaTfLzUe3dNcvWwu3OhCzgaUcdScuTR98m2nZq0BtSCL+c+thGWnEJMRUtbKhV5pOnQDY1iP0DghkP/x4fFlH/S8AnONrU9xdrQRecgniBEkvQVQsVBzOkuZxNLCmZY4NUMOqHL4D0ULywx45qDp0eGQ201lhgDtIGIeq8Y6lcpmeyiBf9yhLPOwNIDnMomX63OM8fSSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3816
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6c99c2dc-dcac-467f-cb1a-08d884b942e9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WBHxQEGJi2PtURgAn+A7woGqgJoFyiGMTSC5VNQZcWdH0aYhW5tIuQCTOUmcWyPSfG3J9QyH0BImMnmVT4uzi6PloRlNREumNr4dWkQ88j5KHn6ohGz52DQvTGIqXVsmlRBd+s6XtscinUssb2cw9uzDslluIlEP+sreiWPJP9byv3/u3luMvLHvSX6hamPx+Z5k4E9FzRAktkFq0aefNfauePaE+sB0m5VIziiZjWbWUIwlNItmykYZhg+CZb2u7w66HZsFu8TcFhnSmboCWyib3Q1PNdVR/AzbyqqYPWJPWVb/p24djLVtgS3t8XjS97tLw1hl2NMxFuh+Q4S4xDqkbOW6lukfz43WMwmcQ34IR127INMHKutxC1zU1FikkrQU/Ri/M8UcNwZbl8gHlw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(396003)(39860400002)(46966005)(186003)(8936002)(70586007)(4744005)(26005)(6486002)(6916009)(86362001)(16526019)(82740400003)(956004)(70206006)(316002)(7696005)(6666004)(36906005)(44832011)(83380400001)(82310400003)(2906002)(4326008)(478600001)(47076004)(8676002)(356005)(5660300002)(36756003)(81166007)(2616005)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2020 14:11:09.1379
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbb30ca1-6f4c-4edf-acf5-08d884b94e79
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5351
Content-Type: text/plain

Speed up wic image flashing by including wic.gz and wic.bmap to IMAGE_FSTYPES.

Change-Id: I503b6ede5aaf188aabd2a925c2c42e5872d7713a
Issue-Id: SCM-1520
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
index 3d31c4c..7c3a944 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -8,7 +8,7 @@ require conf/machine/include/tune-neoversen1.inc
 
 KERNEL_IMAGETYPE = "Image"
 
-IMAGE_FSTYPES += "wic tar.bz2 ext4"
+IMAGE_FSTYPES += "wic wic.gz wic.bmap tar.bz2 ext4"
 
 SERIAL_CONSOLES = "115200;ttyAMA0"
 
-- 
2.7.4

