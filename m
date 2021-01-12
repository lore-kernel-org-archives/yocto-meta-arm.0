Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.86])
 by mx.groups.io with SMTP id smtpd.web12.10430.1610464875300706228
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 Jan 2021 07:21:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=OxCryIpP;
 spf=pass (domain: arm.com, ip: 40.107.22.86, mailfrom: arunachalam.ganapathy@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tp/E2KagJw6JHzyoO2JQl9cyIkEjcZeaKbU1o//8XOk=;
 b=OxCryIpPTJ7dsNpumr6x0Z0Zg2qO6ztoncDrfXsZVC07SDPg7vA+19Ab5nD6BM3DMu6Nnu2qiBCq8X1EMa4/21+9Q+A5mwxkrQIaGbI+ibtCpdTHgFDd4rfFSgavaeDgN6zIwPEcy6P3/dfczD+LM+xMJQZ9dEAOIDON/oTtlP4=
Received: from AM6PR10CA0021.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::34)
 by VI1PR08MB3216.eurprd08.prod.outlook.com (2603:10a6:803:3d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 15:21:12 +0000
Received: from VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:89:cafe::f3) by AM6PR10CA0021.outlook.office365.com
 (2603:10a6:209:89::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend
 Transport; Tue, 12 Jan 2021 15:21:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT012.mail.protection.outlook.com (10.152.18.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 15:21:11 +0000
Received: ("Tessian outbound 28c96a6c9d2e:v71"); Tue, 12 Jan 2021 15:21:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: aaa2fdd9d6cd22b7
X-CR-MTA-TID: 64aa7808
Received: from c5adbb4fe2d8.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 464EBD96-797D-4F99-9EA4-59E8458C5146.1;
	Tue, 12 Jan 2021 15:21:05 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c5adbb4fe2d8.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 12 Jan 2021 15:21:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DzZ/MHrSJVmhsV48jKzQYZ3tHpyDy5h3KQILptcySC+BIQ3SHvcEvGKI+VuUjUFk6uujTavg8YjzpiQxgTe1IxSokXkXIVnROKY7BRm14C7K8eeVy7QzBkvyqrys8MpWyOwpqiBiA54luPbHMEz3gkqcTlakYSTg+EHgnP9erJEvj9PjD1PYZyyLiTu9dZznIXEQjOZpuMF64ymR+OBGyimiW1LR2NoMH8iUu5425hUiUa0HiiRrCJxR4nQA+YlTPYB4S9twnNc34fL7/WWV/oUNaZDD05KrPiDW0llgDbz/SF1Z0KR/tVcPRMm7pfILqhUY0sIspI0i12wxZRNDtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tp/E2KagJw6JHzyoO2JQl9cyIkEjcZeaKbU1o//8XOk=;
 b=abycaRnMU7eiHK0oyuJy5iBVD/w5Wa/T85uW5f80wOJVIlhWkBkg69odGyk2j2I7btUycqBPLsY5TRPZWnONMvGWSjMJ/TNXNllNC1bGh5w7KAINB49QjCBbOmI1nVHGmISK7DeKwX4YgpiqemkGSj5qx+hwR/WsMVE42JXA2P0zGeH3mVlbXGoOMOX8cqawCivj2+tgj+0Npat7/DqUk+DQ+T5sgVt4vWSYGJFg0hdGxILzxl6pQjDTpFZqEpa1KTULhQ2ZZ9NjM70KdseTSVaty57TbBc7jnKxN4GmG9DLGAwwGvPRFxXlDv/TcDjWjiU3IC+JPinHvib7sNLCYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tp/E2KagJw6JHzyoO2JQl9cyIkEjcZeaKbU1o//8XOk=;
 b=OxCryIpPTJ7dsNpumr6x0Z0Zg2qO6ztoncDrfXsZVC07SDPg7vA+19Ab5nD6BM3DMu6Nnu2qiBCq8X1EMa4/21+9Q+A5mwxkrQIaGbI+ibtCpdTHgFDd4rfFSgavaeDgN6zIwPEcy6P3/dfczD+LM+xMJQZ9dEAOIDON/oTtlP4=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR08MB5454.eurprd08.prod.outlook.com (2603:10a6:803:13d::20)
 by VI1PR08MB3055.eurprd08.prod.outlook.com (2603:10a6:803:4e::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 15:21:04 +0000
Received: from VI1PR08MB5454.eurprd08.prod.outlook.com
 ([fe80::b4b8:2245:9a5b:1024]) by VI1PR08MB5454.eurprd08.prod.outlook.com
 ([fe80::b4b8:2245:9a5b:1024%4]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 15:21:03 +0000
From: "Arunachalam Ganapathy" <arunachalam.ganapathy@arm.com>
To: meta-arm@lists.yoctoproject.org
CC: nd@arm.com,
	Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Subject: [PATCH 06/10] arm-bsp/tc0: Enable optee core with SPMC at SEL2
Date: Tue, 12 Jan 2021 15:20:45 +0000
Message-ID: <20210112152049.3436645-6-arunachalam.ganapathy@arm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112152049.3436645-1-arunachalam.ganapathy@arm.com>
References: <20210112152049.3436645-1-arunachalam.ganapathy@arm.com>
X-Originating-IP: [217.140.106.54]
X-ClientProxiedBy: LO4P123CA0092.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::7) To VI1PR08MB5454.eurprd08.prod.outlook.com
 (2603:10a6:803:13d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ts710.cambridge.arm.com (217.140.106.54) by LO4P123CA0092.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:191::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 15:21:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6c5ab896-5ac0-4608-3975-08d8b70db1cc
X-MS-TrafficTypeDiagnostic: VI1PR08MB3055:|VI1PR08MB3216:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB321634CA1C85DA0A21E01A59FBAA0@VI1PR08MB3216.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: vPDSbrEFTqEMLh3o1pBbxaFEXmi8viY9u/b9KJJqs9O1Y/EqlVzM37f8a5EGgLJFEPZ1nxwwHP2eDCFDWeHmkOvHVRWvaXGNZFur+ItZgifComUbIzpcPx7sgLfyf2/Opi+OwNg7FkNHjGeTWBvaKDbhDowI5PwGFmF6Vq1uPufSqZhD/5os8lhUrmn1O9H5RgG4Cb7FsizGSVlLKnm/cuiX1F9FcYjpoDgEk5OPM/uTgAh6PfOjUEy1uvYRnyWm8LdGQXscVdt8SLR9vt0ps+oEdMeKlw6N9vkomLgqURTEK3rukXq3OvYSixOr8TGpJSVDfvuYUxg45jchzzbesbeaE8IVAduz69iQFz6YA2RHpGCVJbiVzAVKuiZs8SqBVqrKjoTuzJkKHbMkoMEdOA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB5454.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(346002)(376002)(39850400004)(6916009)(6666004)(1076003)(6486002)(5660300002)(4326008)(316002)(7696005)(16526019)(66556008)(66476007)(956004)(36756003)(478600001)(26005)(186003)(2906002)(44832011)(66946007)(8676002)(52116002)(2616005)(86362001)(8936002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?YfwMekRLRYbp6SN4L8XMdBdF+ELujY1EqRodky0+lcqJoJNEi+pBFQtvQKDQ?=
 =?us-ascii?Q?MEnH+bZWVZffmCpmEByJUjpPU7tWotjwlnWZNwAlsihOt0AWf78T3JZEss4/?=
 =?us-ascii?Q?KilwmcvQThJGl1pgwgFBwsLu0ZJA+yaDvYy7Teh91j2qZZ7hfVVOpRebUfZ7?=
 =?us-ascii?Q?vbVnxAfj5DjSsUkzt4Q5ARX/6RA1nX+yHW79de4Hf90EUdwSDjjXnnn4eI0M?=
 =?us-ascii?Q?n2lq85iTTU5bjVwb6EAnRiMpFnssgR96bZ/1535jeblzjNzKVxH/ot0Bu097?=
 =?us-ascii?Q?qlciC/jSgP9or7SVWLHuoUssctWgTw/wBVFop34rPfqfKOf4GYpJBeJF/QZj?=
 =?us-ascii?Q?/3qjMPJj0axwlY98EI1a0bc9arRkXYHUN2sUWyWW3oWXAM1mXWg3MRFRWQy3?=
 =?us-ascii?Q?XGvz1egW0E91lCyO4crFYRnpEwJhOytfvKgSMeGXz+80B0/NsolXRXvBIAx7?=
 =?us-ascii?Q?fJey7rvzIUZUN+Eli6V0v1XcCUnfnLIEovLQM9bUQsxarQ1FJQYBFGVLllvf?=
 =?us-ascii?Q?Dagqsmrkh8le1OOcTCgSDwgMyeMqXv/vfvU8KdcLrVOxPgKi2Hgw8nJeg73s?=
 =?us-ascii?Q?bn13JXbvqknAalIWDJ5hUEaKwaoyHuKKIIgvfCQI+z7MggvQ5LAV4peJt6Yx?=
 =?us-ascii?Q?0dY7WiaWnsClo980OhxlFnkJFLZcDmbrchOv+9JuV5gE+wPcEmGbUOHqgdXD?=
 =?us-ascii?Q?hKSjY5jtTvKxq8EId3XKN7TfeUIrJKyATJsoY/6+cRyaAZt4xq6fHduZNaoP?=
 =?us-ascii?Q?/qlk57UpK4bHdTlEHVggM6IkUvKE58ZQfB/v5aQ5Ee/KpeBL4gE5WNxEB8nV?=
 =?us-ascii?Q?CR6bubQayTZ6AxkR6fUgLMmBtCiGvlyb9CeWMaJTSqfZPWDJt7AMHlDHQyd9?=
 =?us-ascii?Q?+J/MH3tSrTWv5dHu95oI2n1J+nX/SqNvQvJL3CLYlWaD62L5pz8xREp595Cr?=
 =?us-ascii?Q?UA6PiigXK9/EWDvRVadzZqFufrpWsw3oZCLeUFWa0NmtOnRmSK5j2aq1XW5s?=
 =?us-ascii?Q?sVG3?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3055
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Arunachalam.Ganapathy@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0c2b72a0-dd0c-44b1-123c-08d8b70dad1f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YWgGXZ8snab6LyD865cmUkPDB1G9+Ub8Uz6hsFM0zPKFeVgDp7U9o0nz/aBmqrWUr8jT1/DHCr29/qlhyNGDgaeEGGx1pIbQtx+nISZCU4q5N1QR33CDLJ43U8e0P/8aHerFuEYau5ZKmUPYkleu1GbcjeNBHV55qy5DXW3S9o/pkLLuWsTxL2hMPggreVH5JX02mvW66k4Lz1roKMhXnMhGta8/hhcQ4WIB7NfLEMUoentO+uTvdeb1WPoeMYVo5oiN+DN1Ybk9ZJJ5uehOC58nxMHRZ+6wjIOocear4BL8d/xKOS/mcD+izsyOtiu6Ye8sM9ZM9xkjTMlDhOfMxrGhB2m+x66HgQaFARVszJH6Te8R0jL6xsV4FSj0w/lDgLlhIFDesyAC/t5fq+rFagyvNa07HbchLYITMkClvRtksi+e7HoGiOBEeLKGDTEmvARytExEjAlo4Mu6rXoE2vankJq4Fj2CHZIraZ0+XBbsux1Wziq9ZrUGqWHhF50/
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(136003)(376002)(346002)(396003)(46966006)(81166007)(2906002)(82310400003)(316002)(34020700004)(70206006)(5660300002)(7696005)(8936002)(83380400001)(8676002)(356005)(6916009)(36756003)(6486002)(47076005)(956004)(16526019)(336012)(44832011)(186003)(26005)(6666004)(86362001)(70586007)(82740400003)(478600001)(1076003)(2616005)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 15:21:11.7034
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c5ab896-5ac0-4608-3975-08d8b70db1cc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3216
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Sets config flag CFG_CORE_SEL2_SPMC. Copies optee manifest file and
sp_layout files to deploy directory.

Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Change-Id: If2104e2d588cbc9fbd9db3d8c4ba9fb74732901b
---
 .../recipes-security/optee/optee-os-tc0.inc   | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-tc0.inc b/meta-ar=
m-bsp/recipes-security/optee/optee-os-tc0.inc
index fc89a9f..fff6381 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-tc0.inc
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-tc0.inc
@@ -27,3 +27,25 @@ SRC_URI_append =3D " \
 COMPATIBLE_MACHINE =3D "tc0"
=20
 OPTEEMACHINE =3D "totalcompute-tc0"
+
+# Enable optee memory layout and boot logs
+EXTRA_OEMAKE +=3D " CFG_TEE_CORE_LOG_LEVEL=3D3"
+
+# default disable latency benchmarks (over all OP-TEE layers)
+EXTRA_OEMAKE +=3D " CFG_TEE_BENCHMARK=3Dn"
+
+# Enable stats
+EXTRA_OEMAKE +=3D " CFG_WITH_STATS=3Dy"
+
+EXTRA_OEMAKE +=3D " CFG_CORE_SEL2_SPMC=3Dy"
+
+# Copy optee manifest file and sp_layout
+# This function will be modified or removed once upstream optee-os adds su=
pport
+# for SEL2 SPMC config
+do_install_append() {
+    install -d ${D}${nonarch_base_libdir}/firmware/
+    install -m 644 ${S}/core/arch/arm/plat-totalcompute/sp_layout.json \
+        ${D}${nonarch_base_libdir}/firmware/
+    install -m 644 ${S}/core/arch/arm/plat-totalcompute/optee_manifest.dts=
 \
+        ${D}${nonarch_base_libdir}/firmware/
+}
--=20
2.29.2

