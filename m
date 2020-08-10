Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.44])
 by mx.groups.io with SMTP id smtpd.web11.50067.1597080786901952010
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 10 Aug 2020 10:33:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=niiMBcFf;
 spf=pass (domain: arm.com, ip: 40.107.21.44, mailfrom: prabin.ca@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YcpM21wnKeSobQKbRQLDl2y18cwZxgZVatjE255++z4=;
 b=niiMBcFfnXmyECfKKFvVGWiSbJiTsaUWHkBuCmm/a7x2fqPnlAPWNSGqjjgHT2eQZJPlaIr7ByOMHFBGbDMRJlcC1MM4SIKZ0GYCTRy3tG9dYs5MU5vCAY/rTllVZtZ653cEXtWAwq4/dTDxsRk/G5XipHVKg80taRpmPd+DCjQ=
Received: from AM0PR03CA0074.eurprd03.prod.outlook.com (2603:10a6:208:69::15)
 by DBBPR08MB5547.eurprd08.prod.outlook.com (2603:10a6:10:d2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.17; Mon, 10 Aug
 2020 17:33:04 +0000
Received: from AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:69:cafe::42) by AM0PR03CA0074.outlook.office365.com
 (2603:10a6:208:69::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18 via Frontend
 Transport; Mon, 10 Aug 2020 17:33:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT050.mail.protection.outlook.com (10.152.17.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Mon, 10 Aug 2020 17:33:03 +0000
Received: ("Tessian outbound bac899b43a54:v64"); Mon, 10 Aug 2020 17:33:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2641ba4f55024964
X-CR-MTA-TID: 64aa7808
Received: from 2769479f470d.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id EDCD0386-AF96-484E-8AA4-36E7247B94AE.1;
	Mon, 10 Aug 2020 17:32:58 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2769479f470d.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 10 Aug 2020 17:32:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mudOAoqhMRARIYEwrTSQSgFATubJEbkYEjb61Y463xwVy6XOFSb9CKTdug323hdMECuoB7fikEDwmpPwYXi4FiMq257hWRkLS0Y9XCNcX23TxHbSeQ2+maIxaYsJBboMQqT4R5zEFhaB2/q/jHeX537m/YrPYugyHvdI9E//lc4+pjk7ETLkNrCM/3ssCJ5NJ9JseIVcZwZlwxE2NtQW81KQRBtBm6OU6QHVeLBT3+7rWO0dHkVau+T4wsIJpTyQFvk1yfUBUAv6m5z+gwiPLahLBp0Dr6BSQYPLEfcctg/WBRSvwxzbeE0+/s8dpNF/y8Sn36qgTTUhCDQ6VMA9lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YcpM21wnKeSobQKbRQLDl2y18cwZxgZVatjE255++z4=;
 b=ip9PcobrvuHUertLsm2sohMvuetCeI3JYBuEYQAiQt8zjtW0hvmJjvyd53G313PydPs+i8YckqGKvM+K4GZRWaHtCIrSjyLvdv3/kSZ415gk2oMF84YwDpnxBVhNntTa6Q3ub8Du+/6+7u+iW8kSsbYD3+tV9nA3xSzMzcJLFME2wkkr2n35yCQyXui7YZCOHedT7NsUh5HYMCJz1R2u0341QejA2S3pYzJGEi9kKT/sBFogCu5kub4CM5DA3ldjNmCgpwPRODG/3wRi7ph0pyhB7HBxSFYk8C0Ea9epr/FaSlXboTLrAyVsgbFEzNHmbMNchdvWet043t3FpoDwgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YcpM21wnKeSobQKbRQLDl2y18cwZxgZVatjE255++z4=;
 b=niiMBcFfnXmyECfKKFvVGWiSbJiTsaUWHkBuCmm/a7x2fqPnlAPWNSGqjjgHT2eQZJPlaIr7ByOMHFBGbDMRJlcC1MM4SIKZ0GYCTRy3tG9dYs5MU5vCAY/rTllVZtZ653cEXtWAwq4/dTDxsRk/G5XipHVKg80taRpmPd+DCjQ=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM4PR08MB2756.eurprd08.prod.outlook.com (2603:10a6:205:c::33)
 by AM0PR08MB5409.eurprd08.prod.outlook.com (2603:10a6:208:183::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18; Mon, 10 Aug
 2020 17:32:57 +0000
Received: from AM4PR08MB2756.eurprd08.prod.outlook.com
 ([fe80::6cc3:86b5:f5b3:89d5]) by AM4PR08MB2756.eurprd08.prod.outlook.com
 ([fe80::6cc3:86b5:f5b3:89d5%7]) with mapi id 15.20.3261.024; Mon, 10 Aug 2020
 17:32:57 +0000
From: "Prabin CA" <prabin.ca@arm.com>
To: meta-arm@lists.yoctoproject.org
CC: nd@arm.com,
	Prabin CA <prabin.ca@arm.com>
Subject: [PATCH 5/7] arm-bsp/sgi575: Add RAM filesystem support
Date: Mon, 10 Aug 2020 23:02:14 +0530
Message-ID: <20200810173216.10411-5-prabin.ca@arm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200810173216.10411-1-prabin.ca@arm.com>
References: <20200810173216.10411-1-prabin.ca@arm.com>
X-ClientProxiedBy: BMXPR01CA0015.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:d::25) To AM4PR08MB2756.eurprd08.prod.outlook.com
 (2603:10a6:205:c::33)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from a076760.blr.arm.com (217.140.105.53) by BMXPR01CA0015.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:d::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Mon, 10 Aug 2020 17:32:56 +0000
X-Mailer: git-send-email 2.28.0
X-Originating-IP: [217.140.105.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7518d281-627d-472c-6110-08d83d536fb2
X-MS-TrafficTypeDiagnostic: AM0PR08MB5409:|DBBPR08MB5547:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DBBPR08MB5547DBCDA95E9C7F8F6E62F0E1440@DBBPR08MB5547.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: hY4a0IRWiOFk8ReL3gKziCV1B5BnycwYorieC+G8BdCyZCrHgQrvK3JOb8fjJsbrfHTKE2/OgeomeUtI8W4Dgk7HAIphymtDkkF/8+ZtLd2EBnoR5vZD5VUjAwh/yqAOQxMCn9L4Rn2qkAJh1zZXjm6nHbOUQOonYVxw38zHDc4FiwV8oYb03speAMcCej4XMRy3iI80L6WFwqCXK8R/hyWqSeUPYdo+2Gvhl6l93sN5wod4y5bBkZ8mIZw7BcAsU4oAmKYZDxj4olF6XqnC6g1OE6ESgAyTfFWXUCKhYsHugENUzsPInLd556in5ObZPTVEIlQVZNXIGJXtV6sGFw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM4PR08MB2756.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(8936002)(66476007)(66556008)(66946007)(6666004)(26005)(6916009)(36756003)(52116002)(7696005)(2906002)(86362001)(1076003)(316002)(956004)(2616005)(4744005)(5660300002)(4326008)(8676002)(16526019)(186003)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: Gjn/Mndet+yDrn5139QKK/vbwM7wSXaJoPzmrEeMvHL7+iRzk38TU/3jlaQirDrevBkQ5kvmSXTftLuKPenz+yUSkL5gTXP7EOXr9ASsrno5aOX8viS+7nkCEEB1zBl0vj0LbtZcQeBwxGuc62MM4hj36WfTrEqEQ9+rwb9Rgg5rd4q5XWNXaTetDxpcmSSx5DIF7RWrUZwWanzGAhK0FKldd5mY8EEgD25HMw7AV+2P+h0KhGTuAzXK6uepcAObwURMsOYXflecndt/S3gukznxDM9snO/Nhu8de2KR4JUGSWOTVcULSsuT7nX+vaopFuVXBUiIzj+sKEi2y7Me5hwbta5xTt204LIMMdaQLN4IVm17noUXWYXOWbFibNOMi6X2nLJrZ7sa8+y/I5H1VBDD+DT/J6Adz+s/OjLBJGn6OhSsnwcaRWC76el+yvAhU+pw5METv2zR4xZWD9FhaEK/Sg5adP71bg7GR2TZPQRe542JRp0YWJH1+EyCcTmdDQQBDzYwUCxTr6Mz0ve/im3ZNJaHjHVUm5lE7OocbOfggLmGD5XGEou1t4BR3aBhkjlGtiuKAtc5OwKJM35yTNmm3s8RVq3rvSvHtejhZX1J2gnkM+u+rgk0dCIqFXWX8DIywZ2BzdLRRBwMRcxpVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5409
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Prabin.CA@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	77778ea6-e65d-4d7c-e3b3-08d83d536be9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/9+p2mlcNHAsnQZv6mgI7WuMZDJPmJOLrBaIncN8tpS/TKVY0LeDmDOMfDqCNWiAqW29t2G8NYuQIGB9VsEKetCQp1xKreMa82o012Z9xE5BNTY4i+j0MiMZ3Kpkwyzr3T2ewOyBb9qDUh4sD7SmzevqF/qyo5U6dpJiJlgeEH8i4AVYQUBe9SCi4sfexgozUyVvZuTBm+hP3Z6Qr2YxjZ0vRNfqhjuotY1ugpkaf2XDpWdT5zqSlBFMP+TJ30MPyjs0FWuNYIR4uUrxQGPu1ivlgtT0FyLATbWaAIVJWrBd5kXjteAolbh7UBMsuF0oZPXldHyw7wF1ecd+r3GGYAP+v5VCsjMo8kTamQnE+1yBHfD7IfrXYzaBmfDYdBJhX/UXwGcDsCSBi5Q2ZH9Vxg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(46966005)(82740400003)(956004)(6916009)(8676002)(7696005)(1076003)(336012)(5660300002)(86362001)(8936002)(47076004)(82310400002)(4744005)(478600001)(356005)(2616005)(2906002)(36756003)(26005)(16526019)(186003)(6486002)(70206006)(36906005)(6666004)(316002)(4326008)(81166007)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2020 17:33:03.7726
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7518d281-627d-472c-6110-08d83d536fb2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5547
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Add cpio.gz to IMAGE_FSTYPES for compressed RAM filesystem support

Change-Id: Ia81563976069666f762492e56b1a706a4ee0c173
Signed-off-by: Prabin CA <prabin.ca@arm.com>
---
 meta-arm-bsp/conf/machine/sgi575.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm-bsp/conf/machine/sgi575.conf b/meta-arm-bsp/conf/mach=
ine/sgi575.conf
index da4f2af..a2e13be 100644
--- a/meta-arm-bsp/conf/machine/sgi575.conf
+++ b/meta-arm-bsp/conf/machine/sgi575.conf
@@ -25,3 +25,5 @@ SERIAL_CONSOLES =3D "115200;ttyAMA0"
 #grub-efi
 EFI_PROVIDER ?=3D "grub-efi"
 MACHINE_FEATURES +=3D "efi"
+
+IMAGE_FSTYPES +=3D "cpio.gz"
--=20
2.28.0

