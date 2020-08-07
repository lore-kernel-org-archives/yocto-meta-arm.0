Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.83])
 by mx.groups.io with SMTP id smtpd.web10.5221.1596804158686723301
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 07 Aug 2020 05:42:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=jhXkwUGY;
 spf=pass (domain: arm.com, ip: 40.107.6.83, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7KyAtbVcLE6rmUi5a24O88VCvLw4gJv0twOrgil989A=;
 b=jhXkwUGY3viFHeW+ot2V9s8UuBERwYR5w/jJV/G3o1Cjtt+7qvpLpUqFm2cE/qoSQdHe/3tKuve3bHv7lBE3/RkbQDm94L2csSgxDdcZpeV7EoDsMPxgZKd/9SREotC0BPD303IBUJ0MIFppYhcVbwUVlxVJDaCromSdtP/kXUw=
Received: from DB6PR0601CA0038.eurprd06.prod.outlook.com (2603:10a6:4:17::24)
 by AM6PR08MB3605.eurprd08.prod.outlook.com (2603:10a6:20b:48::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Fri, 7 Aug
 2020 12:42:36 +0000
Received: from DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:17:cafe::af) by DB6PR0601CA0038.outlook.office365.com
 (2603:10a6:4:17::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18 via Frontend
 Transport; Fri, 7 Aug 2020 12:42:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT054.mail.protection.outlook.com (10.152.20.248) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Fri, 7 Aug 2020 12:42:35 +0000
Received: ("Tessian outbound a0bffebca527:v64"); Fri, 07 Aug 2020 12:42:35 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4eeca50beea36ba6
X-CR-MTA-TID: 64aa7808
Received: from 3b75c71ac48b.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2523BCED-E4F7-48BF-B27F-713F7B753B21.1;
	Fri, 07 Aug 2020 12:42:29 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3b75c71ac48b.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 07 Aug 2020 12:42:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ljYIVo5Mx+nZ3JDUt77SXPcH/tifmfoCGEICN5W9aTer1/v1Sv8VBPnnQQiFfrGBLmH8rmafzOW2Riauij4AKd2I85HljqUM5ATgxrMtR+TsY7wR3/WSAJgHqjsecI4AXed9jhTnrIsB5ug4812B5mTMpPPNaRR4mk3SqPIa6tn9Od+3a8NC2oes53fvK9Fp0uDtvhuHlLCl2wC+xMCeL3640t8e36KMkQbgt0xeHjNnud87ay0ovDJmaciStn42mpYHd6wSGXf0wT/9FAJ9EDjP7BN77B2RVeLdI5RcoSukO7kaZ5NzoRxtQIpiQz616iuKxyNrZIbtEf5G3E/NTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7KyAtbVcLE6rmUi5a24O88VCvLw4gJv0twOrgil989A=;
 b=k3PCHFWzAM/PF98eKSfJ+PpWWEeV6uHYG+7+cTLiWgVDz+bfY2fpC9wUXzqEluWJJWmN/EE0ZmHU0iluj1o2h6ZTccQLCXDLAEvC+8Gb5WNQ5iGeKzxxtH57t4k6cakTPDoeZAlA6XIrMAZgmY90Pu6mgcj0iJztvHF5NdOayvxnM1akzGaSN5BF+zxI2dhmc6xmlxtKpPXHNfMLq2RwJUVpiRRmTe0HYzDPQYM4GRK0iSFeCLmv+VuueHZJEa5nEziCKtIx7lPbh1iPRkkNWQKe8fzwqnJC0wNs1VRRzVbnx8tKK7r/eHb3P30R9gOCEl0f1F4hqIQKQ9lBQlGf7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7KyAtbVcLE6rmUi5a24O88VCvLw4gJv0twOrgil989A=;
 b=jhXkwUGY3viFHeW+ot2V9s8UuBERwYR5w/jJV/G3o1Cjtt+7qvpLpUqFm2cE/qoSQdHe/3tKuve3bHv7lBE3/RkbQDm94L2csSgxDdcZpeV7EoDsMPxgZKd/9SREotC0BPD303IBUJ0MIFppYhcVbwUVlxVJDaCromSdtP/kXUw=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com (2603:10a6:20b:ee::21)
 by AM7PR08MB5528.eurprd08.prod.outlook.com (2603:10a6:20b:dd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Fri, 7 Aug
 2020 12:42:29 +0000
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d]) by AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d%6]) with mapi id 15.20.3261.020; Fri, 7 Aug 2020
 12:42:29 +0000
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Rui Miguel Silva <rui.silva@arm.com>
Subject: [PATCH 8/9] arm-bsp/machine: adding corstone700-mps3 machine
Date: Fri,  7 Aug 2020 13:41:54 +0100
Message-Id: <20200807124155.24198-9-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200807124155.24198-1-abdellatif.elkhlifi@arm.com>
References: <20200807124155.24198-1-abdellatif.elkhlifi@arm.com>
X-ClientProxiedBy: SN4PR0401CA0043.namprd04.prod.outlook.com
 (2603:10b6:803:2a::29) To AM6PR08MB4934.eurprd08.prod.outlook.com
 (2603:10a6:20b:ee::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e121910.arm.com (217.140.99.251) by SN4PR0401CA0043.namprd04.prod.outlook.com (2603:10b6:803:2a::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Fri, 7 Aug 2020 12:42:27 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0d303412-7ca0-4d89-0150-08d83acf5c1f
X-MS-TrafficTypeDiagnostic: AM7PR08MB5528:|AM6PR08MB3605:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB3605022E9278BE386028D593FD490@AM6PR08MB3605.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 geq5GeNvBVlieHcIbjo/4iKd+iKRlN7j0Hd83zAUo202tYBxnCfKTu7IqvaSlkzmrFaRcTCFWQOIx82/yCN5Du4zZwlIn/BNlTVAcJLv7V8cni+0EXSgzfrvkeODdVigLYPbUu/y3ss90ixzhv/KdNdfoJK2ueEKAftJbCT1ynz4jgmcShEG1LRYiVkr4MLttRGHLGn1EdHTJGU83NmkiJ1vAIS0FhMdy18QhJwO1ySCdFqYfn5fcsxwYlK/gN7ngdx6J1JEZJVrgjP3Ztzx3CUesOQg+Rs52iSQM5JZFW+J0iAfvr0uK0gUgkoxNJRnkWmejtk+CvFfN+Aqz2/NpP7zrIBU0Fc2bQWDju0YmSKhepy8WNA/AKMDtew63zotpMVSX4x5pRwX/gZCZZiYiA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4934.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(66476007)(66556008)(36756003)(9686003)(478600001)(8936002)(8676002)(2906002)(6916009)(54906003)(66946007)(316002)(6486002)(966005)(4326008)(6666004)(186003)(26005)(86362001)(1076003)(16526019)(956004)(2616005)(7696005)(52116002)(5660300002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 XyVa92GK5EUULvkh47q09s7exQDUbAN6d3vLhX04eO008dGsgOBhkm8aSAyuehlzp9QlRJmE1LAMy7cIB9B4uV4U+85Sml+T0hBi+mMXz5KywH/M6/6EKH0KuGcbsQftRx/LfI/uNYevNN9B++laNMTSeF2+5NgSj2wz6lk8qfijOpOtrsVF+mJ3qCntnLrfa7nr3fhv5iq50OmScT6jxgnTcuxy/48Wq1RenlbCLk/35HAmB4BPkNlMxwk8UEsWaXJ3gpVujmHztCx/Po8YjJXr3biTCPFFm4Wxn/5LRkvYYsXXbpvd+MWCgoqyfk+qNgYXhVy3LfYoV7xBH9seDRq9mIblUFZjfZgnHkPF0ao2+e3Hh2gVLFPZuPE3uDkYYL33e0aGhlC1NNwDraukEmsfl896pTQS4AHqZ+z5yYg9bd+V1qIH6t66/wp8tCXkzHjeQwfZLVn08OAXBLcFuf3OuvCgThNK66H/wDLzmLbCJLLFdY5JGegxFta875ORMADgYcw66WlU+pFopBw+1n7KK2LT3vFi/XC4kZ57m+usNDEdg1s+Rb/xfy3RZaIU2L0AwJd9+ZpzzwM3lKNRGMDL7gJYzulBRBP45n3zc0aBpnqThfl8UdmIpVSK2x16PbS2vY8yVj4Do+uNrTAJrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5528
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4f8009b7-2ef8-4140-1ab6-08d83acf5868
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RZj2sDVLWmD21xdlRWBpRDLTLrnrGIIFz1+6z1L/PzhGfGDIG2gImRTYcVq/058j66M9vGyNrH9LhoHbmxHj+nPV6Gu+3G6v64zHBnvrfylDSFKjDkidsD/ouc2bWPFnpt+0qrKWKalkwEzUcbmCX8bhLnekoandWIHx/GJ+TZJZvrqaeTgx2IvqwMHXTpR4PACD7gPfMHPb9S9kZ+uFz24OyDamVSfi62MWMAjv2BhBS3vrpLnm9ywD/vyAv4gKIbsGqNDblIRrP72+VGIqtKlSr+HtYQ5vapXyPZ1JW+Lg34EsanP/ECYJ2NNp20MmZlmRBWPyL2REQyalgmBS1UKanNm6LvQ/FjIh4saZ7GAVjQLJgOAidS3IL7dvzztbSoBU28WWGGRb7MI0KG+5Bx+nFEVnE4TohUEwVjgtZ9Ox0Uiqy82c1bkNCwVXbL/Z10oMbgtDFkTLYH+W7rEvk1UWbPAWtKGQ5HQj0ELuQ9o=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(376002)(346002)(396003)(39860400002)(46966005)(54906003)(6666004)(8936002)(70206006)(316002)(2906002)(4326008)(70586007)(82740400003)(47076004)(6486002)(81166007)(5660300002)(9686003)(356005)(336012)(6916009)(82310400002)(16526019)(86362001)(2616005)(186003)(1076003)(8676002)(7696005)(966005)(83380400001)(478600001)(956004)(36756003)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 12:42:35.1042
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d303412-7ca0-4d89-0150-08d83acf5c1f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3605
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
