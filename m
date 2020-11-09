Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.51])
 by mx.groups.io with SMTP id smtpd.web09.9461.1604916549467003866
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 09 Nov 2020 02:09:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=VoRJko4n;
 spf=pass (domain: arm.com, ip: 40.107.0.51, mailfrom: kamil.dziezyk@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/F2O9hPvy9zPK0OqLQ38pN/Q/PQJcPD2oYPKXRYnHvY=;
 b=VoRJko4n4K6/QKRTOuAhYG4N5X598TSYLfrcL6kQ/HvOfHPFu8OHojiOw3xuJbp6NIDN06imI8o434J4RbK6jW/puS8gf1A3hdRh0ag0Zo4ylelfnVFM4jfY4VcwY1sp8XtyIC3TbQrYDeRaXKlCirbZLDwZDaxntFuT7DNwWsk=
Received: from AM5PR0602CA0001.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::11) by VE1PR08MB4768.eurprd08.prod.outlook.com
 (2603:10a6:802:ab::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Mon, 9 Nov
 2020 10:09:05 +0000
Received: from AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:a3:cafe::50) by AM5PR0602CA0001.outlook.office365.com
 (2603:10a6:203:a3::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Mon, 9 Nov 2020 10:09:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT032.mail.protection.outlook.com (10.152.16.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.17 via Frontend Transport; Mon, 9 Nov 2020 10:09:04 +0000
Received: ("Tessian outbound 797fb8e1da56:v71"); Mon, 09 Nov 2020 10:09:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 331b84921568b3f6
X-CR-MTA-TID: 64aa7808
Received: from 3ff3f4a58fce.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id AF399FAC-3B6F-4A04-8AD3-EE208959402F.1;
	Mon, 09 Nov 2020 10:08:59 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3ff3f4a58fce.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 09 Nov 2020 10:08:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IGDngxgfU20cIozIKz7lu1QFYx7ly9lSGnYVDd8xNARxwAk0MOtgtOnCANLD1rPv+GeQh2rRbrmgqPxTIMrDelhpKZDB+kcrY6KSCj689w2ERx/NuaMW/PPE4MZMlysphfaYvfJB2xMvslUh9pB6lf1M86N70E9EgVijCJsWSlcP7F4bzL06E94VDMb8iAvWoJlkE6NPagpGRAGGmOvPDBq/0AtrYWEbXnKRdz+fGqpu8vxItrn3aLxrKZSr9/3EAlMV6gss9x9h2u4qPszIM7xXdgcAGG1NVnRdNhzJeOjufG7hebaYx1pxRXg+6uVivexrhIoaRpew+JaiQ24PmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/F2O9hPvy9zPK0OqLQ38pN/Q/PQJcPD2oYPKXRYnHvY=;
 b=VtG+IKWDHm4ySjAr3qiDnq04o/7YWPFTEwEs1HkOwFAO35DgsR0NW6vAS2CiFmB32MTywGuFwgUqtQ91tJCJMvgrzkTNfSkd/T4uHNTOGSQm7WgS+yZp15ldW+EBNLxNcF8X8rxJjsx4oTD5wjdHc4P3QMP7IqZ7Nefwnx/GTDArZSwsfYhjnEntoQ4cZvD31GeI28SBbq2SMny1bIAT/tElAdtKcEPLcQCtVj9ODpcJ0p8X8RVNRQaK4QljCyJXoZBSnCUj4vlh/Oyx1RVAnrssh29atlBoIzNTLgcaIIMs3+NgOOZUiJQl3gfRd9snMfWhLsU4dQeyyl9mcyUc+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/F2O9hPvy9zPK0OqLQ38pN/Q/PQJcPD2oYPKXRYnHvY=;
 b=VoRJko4n4K6/QKRTOuAhYG4N5X598TSYLfrcL6kQ/HvOfHPFu8OHojiOw3xuJbp6NIDN06imI8o434J4RbK6jW/puS8gf1A3hdRh0ag0Zo4ylelfnVFM4jfY4VcwY1sp8XtyIC3TbQrYDeRaXKlCirbZLDwZDaxntFuT7DNwWsk=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com (2603:10a6:10:f3::13)
 by DBBPR08MB6201.eurprd08.prod.outlook.com (2603:10a6:10:20a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Mon, 9 Nov
 2020 10:08:57 +0000
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::7481:42d7:df72:b159]) by DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::7481:42d7:df72:b159%3]) with mapi id 15.20.3541.025; Mon, 9 Nov 2020
 10:08:57 +0000
From: "Kamil Dziezyk" <kamil.dziezyk@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Kamil Dziezyk <kamil.dziezyk@arm.com>
Subject: [PATCH] arm-autonomy/xenguest-network: fix for unbound variable in network-bridge.sh
Date: Mon,  9 Nov 2020 11:08:49 +0100
Message-Id: <20201109100849.11401-1-kamil.dziezyk@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO2P265CA0364.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::16) To DBBPR08MB4696.eurprd08.prod.outlook.com
 (2603:10a6:10:f3::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120195-lin.arm.com (217.140.99.251) by LO2P265CA0364.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a3::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Mon, 9 Nov 2020 10:08:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3e66cd2c-4d1b-4728-bf89-08d884977d30
X-MS-TrafficTypeDiagnostic: DBBPR08MB6201:|VE1PR08MB4768:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VE1PR08MB47682926850FBF20407DF557FDEA0@VE1PR08MB4768.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 vYtWdRN6fWPF+dBZ0L+jtdMc9VJNDJ6tbcRPev8QJFMRcExKT26pJ6KEYxwYCTFz6HGjVWKv31p4i+ENPWQkBpGc9Z1R+WzpsGRea0U8NC08j7ox0vpv1qMvw+JiakSrENmZg9Yt/N8ST4ACnoargBoc7ecFGctXi4pKYRh73Lde0OASiCngpy/gwcVc6xqwu1T9KrB8NayeE4kdysT1GNKzzv3+rgvFqhaSKt/HThfkZKg4Q6xrIXGn6gZ+N0zmWgqxo+hxvqNUs3ZGQkMwFaSjSGC+sdUkrJS4b1jjF4tEQwzNgyEtzpxvR1cCZStZn4wtDdWKix+Xq6RTgR1pRw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(366004)(136003)(346002)(8936002)(2906002)(8676002)(7696005)(52116002)(44832011)(2616005)(956004)(4326008)(86362001)(83380400001)(66556008)(6666004)(5660300002)(36756003)(316002)(1076003)(66946007)(66476007)(4744005)(478600001)(186003)(6486002)(6916009)(16526019)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 oV4eAuFqAS8N74SHbfpYWCJeWvf6ELHD9M9tll4H82tDV2w6EUUX3aaQQ5cHACuzgursXvmD6MEQxsOA8SH2K12JAfpwi7yLwq0XoJzWVRjEo5nj8YYuQjvUjho6bTYnhlkvWj/aS7K+gNh1o0cK2VHkz8hlJcSMYI2yT2jqeUWxy0Q5BjW1LSHMWvdeKGjflgiwx9LbaL0BO5GschGU2NG97zGDXBdOaNY2UNVP4C/QvWCzYZqoE5A9MdRfhzlCYZxXqfJlR/iOJ9CQW0ZCYeK3/4GxiP/jnmroTIz59kNbvSL4VZIQaGq+D45Cj4jsy3HfjaLsqt020Awnwq7r98CiWeooVUmrVierzA2svlBcnUX2tsmGeXhKM0lZQXMRuB9Ys26eh+63lxUo0bY/gK8Dz5+VnKSXgD9Z0Luy436YpOi+YzrkAPGyi4CPV9HJYH1JReuL51z3QLH2MrRfT9ShxCKDazf4N36UiNyUa/+a6PYS0KqA4KXKGn+aPsJor/73CAU2seZ58ui2bTaNj/5PnPalx/Dn7vNQqd93rlVe3cmqF7AIKULhsSAMmzfGrm7kYd5b+lsc3bY93tz+G1lj5CoFrckr1muoyH4f/8mTZZ9vH0q6eVQlpiBuj1oqMOvbGsHQI0+7OjnglYkdrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6201
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Kamil.Dziezyk@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0e7ad38d-e49f-4e6e-3fc7-08d8849778a8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	p4qNk3G8JXVnnQAt1eiAmDSn+HAPqFb1f4Pw10t23T09y3jhm+ecXqvqeat0ShpK7mWLbEk6jOs2h2ngR93Ft9D2Ylrs10RbmcKqWtDkOcgkBy+pDHVtofX8QSQxuhCgtlLnpzI9cg/A47Cu0bFtCW1vm1cHnrWrLoxbfoZt3U8T+EKASjXpUg1Rj8TlTPVWD/KjHx5sKOSHZivB9EarCnnqypBoDIHEXARga6QdGoOXMx8c7qTTB2wdlKS71Bsql8HKHdAKz0TpbQ4i/szypd5aXqP9ZBcIC8RUCVhXwUtVSJl7uehbgg+lXMXIp80NE8egLGuGBoSupTBf1NIWe5f5wPpU2SFgfj3NtZH2GgKqESbfXhsT6ggFuG+/QBlulB9PTDuXqLC4MBzXms6zOQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(136003)(396003)(46966005)(7696005)(81166007)(6916009)(316002)(5660300002)(83380400001)(186003)(26005)(6666004)(36906005)(336012)(956004)(2616005)(16526019)(8936002)(356005)(47076004)(82740400003)(8676002)(86362001)(82310400003)(36756003)(4744005)(6486002)(70586007)(70206006)(2906002)(44832011)(478600001)(1076003)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2020 10:09:04.7581
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e66cd2c-4d1b-4728-bf89-08d884977d30
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4768
Content-Type: text/plain

Undefined 'XENGUEST_NETWORK_TYPE' caused an error during guest start.

Change-Id: I5b0adea523f884cd4b649e3b85ae7e8860eb019a
Issue-Id: SCM-1633
Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
---
 .../recipes-extended/xenguest/files/network-bridge.sh.in        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.in b/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.in
index 46d230e..967c245 100755
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.in
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.in
@@ -8,7 +8,7 @@
 
 BRIDGE_NAME="###BRIDGE_NAME###"
 
-case "${XENGUEST_NETWORK_TYPE:-}" in
+case "${XENGUEST_NETWORK_TYPE:=}" in
     nat)
         echo "vif = ['script=vif-nat']" >> ${guestcfgfile}
         ;;
-- 
2.17.1

