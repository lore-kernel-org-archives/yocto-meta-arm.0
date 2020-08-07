Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.85])
 by mx.groups.io with SMTP id smtpd.web11.2776.1596792398509210925
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 07 Aug 2020 02:26:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=nwvjgE9B;
 spf=pass (domain: arm.com, ip: 40.107.15.85, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7KyAtbVcLE6rmUi5a24O88VCvLw4gJv0twOrgil989A=;
 b=nwvjgE9B0K+czvLOVpatf56K/jtDbOQl8M7AL5c7e7a+ZMTHMxdDllFJXRl//e95NCzUDtWmeTwpUlqx/59wofpQTGTQhIAUq0YS9BSMUdNV8jJfw0Pl/tmpFbQnPC+AiaQWo3x/BImKX6eNmfHnDuNQzk8WSdBE0rCqXovphX8=
Received: from AM6P195CA0082.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::23)
 by AM6PR08MB5544.eurprd08.prod.outlook.com (2603:10a6:20b:b7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Fri, 7 Aug
 2020 09:26:36 +0000
Received: from AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:86:cafe::58) by AM6P195CA0082.outlook.office365.com
 (2603:10a6:209:86::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18 via Frontend
 Transport; Fri, 7 Aug 2020 09:26:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT037.mail.protection.outlook.com (10.152.17.241) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Fri, 7 Aug 2020 09:26:35 +0000
Received: ("Tessian outbound a0bffebca527:v64"); Fri, 07 Aug 2020 09:26:35 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: aca60af142fa762d
X-CR-MTA-TID: 64aa7808
Received: from ffebb0efdc23.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 52E5F389-9D5C-43E4-9CED-1B7F115DF437.1;
	Fri, 07 Aug 2020 09:26:30 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ffebb0efdc23.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 07 Aug 2020 09:26:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PxnoGLP0QwYDBIt8gvDQ2qeTGViFfuTex2Bs72ewnM9zzO5YhKiHHJGxs8ISIODg8ZymleIYfx55/IrvIqfbWvKnuybL0lRdDXaJVUa/1fCdLColKNOhvewV1YTLBOTTEogndhgzmDJX74gKi/NSCXYmu6rXY/+8lTXtlQNg4sE8Po8kvf2taNlGw+9a4V09UyWa1YFvQokefqLOhQzvBW80LkFlrM9YFz3fGp52NlDhdLeGZSDzfDB8VAkjrpm/YworL9fAV5pw391JNQR6YL3k7IVeANF7Dec37xkczY/V5w7X362bcUlDX8++vHBxhscvW0CO2R/K41Dh2FLEHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7KyAtbVcLE6rmUi5a24O88VCvLw4gJv0twOrgil989A=;
 b=bcW3iSBvPwDmtO5kLFj6u9U0WunSIe4k/fiibbsm633mkLDANSwlhZo1cUxPKVFWJSx8VteIVgUoxXO1WkeYUg/E5oW5RbjF/oT8KFGiLj5T2IhbqgLx2sVpcBMgeZpyTNUIkVypS9biHmEi9phujp5yqlb4kFRRgX2wcZhHA7k5XawkI9VD20Cf88sLC+/oKdXv9Gck6c68q4uE2yUZRDXMUpQlss2M6EQsCcp1fFXAlMQz87Vo0zOrIjssdz9oJLqnDqBJj4MBFU5LNuCrKFrV9ec0sRMQiPrW814MDopLxojkBjY3JMIhQzD5pxRnyQJr+01XaWUCjYI+PS7EcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7KyAtbVcLE6rmUi5a24O88VCvLw4gJv0twOrgil989A=;
 b=nwvjgE9B0K+czvLOVpatf56K/jtDbOQl8M7AL5c7e7a+ZMTHMxdDllFJXRl//e95NCzUDtWmeTwpUlqx/59wofpQTGTQhIAUq0YS9BSMUdNV8jJfw0Pl/tmpFbQnPC+AiaQWo3x/BImKX6eNmfHnDuNQzk8WSdBE0rCqXovphX8=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com (2603:10a6:20b:ee::21)
 by AM6PR08MB4705.eurprd08.prod.outlook.com (2603:10a6:20b:cf::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Fri, 7 Aug
 2020 09:26:28 +0000
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d]) by AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d%6]) with mapi id 15.20.3261.020; Fri, 7 Aug 2020
 09:26:28 +0000
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Rui Miguel Silva <rui.silva@arm.com>
Subject: [PATCH 8/9] arm-bsp/machine: adding corstone700-mps3 machine
Date: Fri,  7 Aug 2020 10:25:52 +0100
Message-Id: <20200807092553.18876-9-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200807092553.18876-1-abdellatif.elkhlifi@arm.com>
References: <20200807092553.18876-1-abdellatif.elkhlifi@arm.com>
X-ClientProxiedBy: SN4PR0501CA0112.namprd05.prod.outlook.com
 (2603:10b6:803:42::29) To AM6PR08MB4934.eurprd08.prod.outlook.com
 (2603:10a6:20b:ee::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e121910.arm.com (217.140.99.251) by SN4PR0501CA0112.namprd05.prod.outlook.com (2603:10b6:803:42::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.7 via Frontend Transport; Fri, 7 Aug 2020 09:26:26 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 486458d8-8ac0-4523-8e33-08d83ab3fb22
X-MS-TrafficTypeDiagnostic: AM6PR08MB4705:|AM6PR08MB5544:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB55442DC7D27569816B880BDDFD490@AM6PR08MB5544.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 KEEr5jDE2enaCuoravZH5ZIQsFN1vS/ffe9qVNMuLNtWldp/2uYqBsii3kFEHJglZI0gaMEu2BQGI5GqQ/0tFvr0AncXCmzKD0GbY2qvQMGquRKMgmOUDnj7bRchNJsl7LRcXA3X0hVW3h78OhHlLbMmdTIoQ9Zn+2JVTGbMyehd1DWmV7k4LFWgTjbZx/pQ1bO23jMmdC+aadFM+IYAMIMn4fHHaRDUZ2kxcJp5UakvSfoX3ubfJipE3wSiv0+GRqVqyHpPxcXPsLGwAGgH8Zuxl4riIlEdK/XRU82ITFy1f79ts8NHlYey4z2jdxdl/dxB+cpzYhTDFS11RXSUJcY9Vq60XgI1iFCoGd+9F0yaHvRLx3eCXYiRmRXy6M/YhY6fTpTT4Y1CfWtJP7N9iw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4934.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(83380400001)(4326008)(9686003)(6666004)(86362001)(6916009)(8936002)(6486002)(956004)(2616005)(7696005)(16526019)(52116002)(186003)(1076003)(2906002)(26005)(66476007)(66556008)(66946007)(316002)(36756003)(54906003)(966005)(5660300002)(8676002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 ud1PDi+0w9dRE5plWUl3RAC+YbkMGEEHh0yHFBuydWf+VemvyKpvw7rqCFNmsV4gvQ39O4UVtsl+ztYe0Fk/LnBH9XX3izq87vCcFLNqhwSCPm0ey6Yw0sccNH5Bx+y22jqFpNvOQPJcIMti3D/wkmSoi9O4FBQlxwgh+ukpAMdXg4g1kqW+/BDNrnai5SkWloDwTfZvQjr5+ZNi1Z3asAg7XDU0dnDa0cRRqJGmL2AGgsorQrHagqVeIn0MqWqRoja2UPALYK8WZBRz7YMpTmkIcPt+j13HS6HP2Ep72aWfXecCRJgDGLwPGT1TjYCIHxCUyQnXNlmMX3X0cuNQK7cLKLDWvvYp7A+/8gui0+KxyJik2wxH6tmXEvXXEJp2pBmYoHN3vFAdvtsIN4SeJKYZeYmwmXUo6klmAn+xXO4f463bEKdeDV4vhR26t8aMQqiypYSo7lUFpngSnA12FrfFef/QKoZlyaGjnZWMIYOkZMIqLbxVFE8gN2OtgDaC9RL1YI4LKZT8CG1yjVToL1zSKWzt5hV5tmwsCfS5hZsBm/3js43oUu5A0lCd5O7U0vQc9u3kKFnXcAgP2cbxKsYXTYYI9t/7CZY6qFKuvpsjnK7aETJ91RkTPzI1zsaxP8BMnM314/1P6WBWTNTUqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4705
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7eebaacc-47ef-4a50-ae38-08d83ab3f696
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tEtrc2N6MIJVnLu5q9y6k///tad+dTvkteNapkh0SFW5h1Q6/YuXlg9Illk+IUkbURcKu9ugWw5a2BOEf4y6slzzb1Z7+yHB4LmQ/Br0aBY+xi9ONUzaZKAlPb4wHBygAcjmBtx4r1ADZkMjRoFl/4q82mwde9HvGXCDr0Y7HGmOo0AFid5tWcQ1f+YAeAjLsgixuGe9eWLpk/GkgbYJaMJAT3kJ3jc+GzzugU1sMcJZwS8Jmrpf/WBIsCdNhZQuMlRY8nsoUW9FVrR/LS1RAxHljFkmPPi3jef7L3+TZPM/N4HcU8toknvdclHJzpykEWtBn3P5MZQpxZfHtsoYX9GVrgV5McwIMjQ5uDZa40iHK4HKM2BGXlZRRtM+/ltxopi/MwCvfD7xhtyb2CPykeph7pnE64P/Obbyo5vYGDOJv4y7JNGE1ZeOw1uBotK5Sa3exmGKU2eQFAnFmychfGIYPyMtKQK2ALah1BeJoaY=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(136003)(39860400002)(396003)(46966005)(2616005)(186003)(16526019)(1076003)(26005)(83380400001)(966005)(82740400003)(47076004)(356005)(82310400002)(956004)(6486002)(8676002)(54906003)(81166007)(4326008)(9686003)(8936002)(7696005)(6666004)(70206006)(70586007)(6916009)(36756003)(36906005)(316002)(5660300002)(336012)(2906002)(478600001)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 09:26:35.9218
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 486458d8-8ac0-4523-8e33-08d83ab3fb22
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5544
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

This machine provides corstone700 platform on the MPS3 FPGA board.

For more information about the platform, please check:
https://community.arm.com/developer/tools-software/oss-platforms/w/docs/444=
/corstone-700

Change-Id: I7b654fcb8dc5c6efa261a1413389271df87534cb
Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 meta-arm-bsp/conf/machine/corstone700-mps3.conf | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 meta-arm-bsp/conf/machine/corstone700-mps3.conf

diff --git a/meta-arm-bsp/conf/machine/corstone700-mps3.conf b/meta-arm-bsp=
/conf/machine/corstone700-mps3.conf
new file mode 100644
index 0000000..28d7050
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/corstone700-mps3.conf
@@ -0,0 +1,7 @@
+#@TYPE: Machine
+#@NAME: corstone700-mps3 machine
+#@DESCRIPTION: Machine configuration for Corstone700 MPS3
+
+require conf/machine/include/corstone700.inc
+
+TFA_TARGET_PLATFORM =3D "fpga"
--
2.17.1

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
