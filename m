Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.58])
 by mx.groups.io with SMTP id smtpd.web08.4530.1604412852171561657
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 03 Nov 2020 06:14:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=KTv+w6R4;
 spf=pass (domain: arm.com, ip: 40.107.7.58, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=42+2cDOmu7hm8mRgfkU9k6JtD8+060SEO/izNmARP3k=;
 b=KTv+w6R48/vPb3DQ46zNxugOfZJEj8AoBCfXH5qeI3DC5928UvpUVlJk7WXEuL+UdP+FbkBw6MnDXY6dX29Vib3VdPAOKBf5IggLiK1uVVeZC+/s8lA1OEPlBUMDpDN+IiqUXBb9ouVtt2NHtsRVV1/hJa1bl6exISnPC8h/sMM=
Received: from DB8PR04CA0030.eurprd04.prod.outlook.com (2603:10a6:10:110::40)
 by DB7PR08MB3018.eurprd08.prod.outlook.com (2603:10a6:5:20::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Tue, 3 Nov
 2020 14:14:09 +0000
Received: from DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::18) by DB8PR04CA0030.outlook.office365.com
 (2603:10a6:10:110::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Tue, 3 Nov 2020 14:14:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT030.mail.protection.outlook.com (10.152.20.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Tue, 3 Nov 2020 14:14:09 +0000
Received: ("Tessian outbound e6c55a0b9ba9:v64"); Tue, 03 Nov 2020 14:14:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: bf46aa9b1d95c506
X-CR-MTA-TID: 64aa7808
Received: from ba1d40dfc56f.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E8521A61-7321-4309-A815-1265F72EE7CA.1;
	Tue, 03 Nov 2020 14:13:52 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ba1d40dfc56f.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 03 Nov 2020 14:13:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XcVaWX/aT3I7TFSXF04+m3JUUWZ/GCE4kgs5Rjp5AKpdaRWqosLga5VFbfZTWa5iERQrLADE3+LsSu8zIXu2owGYcCx259ZLMua8NEeUoMhEIexEWRh1s5TpVuCKcg01jU/M5k23IHqa6J6vdvG0mlATNpnC7J0mpqYO0NrpDaSR/JIBF7eTj2OQCLqgGMBxOe5Nx1xe9z+tc/7WcCi7v7CvOcBP9P+pQC8L0AdN8ufWzsDdp1HszA0whyGYcwd1Q7b1d6SdfI7mIQyWO30myGK6th0TXEMtixkuJK2NWyHPf7gnXfqFYBDaoKLxDnVDAZZ/wUHSimToM3iQ6xsDxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=42+2cDOmu7hm8mRgfkU9k6JtD8+060SEO/izNmARP3k=;
 b=nHwRZx4QNimYAVQIqL3heduBI84tjLcd6G10cN1EDfKYfsjQ34ABXcpzUwfC+K89Vpifg5zyUCz7tWahGiVCBQgpomOJ+6DLKmZfMo1hgEjKGbadUZu2ppBdGeeHxTtGNuybpE2VL5KyLIpwIz/4TYVJ3BH3NPTggmuBtsblSPooH8XFwQvcStl4BEYfAaFIC49Ibb0M8u/LMxjr0Fu0ed0/nuwmJe74/FwiKlgtKfrMBcq36unbANljS0JOGoO7+FDxhQBWCqzg/K34gy3J60h5wjhVD3toLHyJ+T7+NVqj/OfuLTl0t7ki4mHtiXOq6VTfF5WM81obQJBk934HIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=42+2cDOmu7hm8mRgfkU9k6JtD8+060SEO/izNmARP3k=;
 b=KTv+w6R48/vPb3DQ46zNxugOfZJEj8AoBCfXH5qeI3DC5928UvpUVlJk7WXEuL+UdP+FbkBw6MnDXY6dX29Vib3VdPAOKBf5IggLiK1uVVeZC+/s8lA1OEPlBUMDpDN+IiqUXBb9ouVtt2NHtsRVV1/hJa1bl6exISnPC8h/sMM=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM7PR08MB5527.eurprd08.prod.outlook.com (2603:10a6:20b:de::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Tue, 3 Nov
 2020 14:13:50 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf%6]) with mapi id 15.20.3499.032; Tue, 3 Nov 2020
 14:13:49 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH] arm-autonomy/linux-arm-autonomy: Add CONFIG_OVERLAY_FS=y to docker-minimal.cfg
Date: Tue,  3 Nov 2020 14:13:45 +0000
Message-Id: <41ed6717b6cdc1fd31e4bcfc575fdc9dd10c51d0.1604412807.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.51]
X-ClientProxiedBy: LNXP265CA0072.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::36) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.51) by LNXP265CA0072.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5d::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3499.19 via Frontend Transport; Tue, 3 Nov 2020 14:13:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a7b357ba-cde0-48e4-28f5-08d88002bb3f
X-MS-TrafficTypeDiagnostic: AM7PR08MB5527:|DB7PR08MB3018:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB30183ED7FBBF68CCC7DA280192110@DB7PR08MB3018.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 1/hN+ISCU8A8pHogcU9pWURwamYoFPemG7O/VxDkgq8dnin4/SrfDMdvkMxuVMidojpNFZOrTwvvm3uH9vpV7sVoW/vYNreWnYyjmFPLyHysS2STSvulqRy8ETJHyoAeUubLMXAJUFb204A+XwyBtFwlKRnkWK6BwYiuAZDD8X/8Ms3GXB0axlSCpu318PzNe+PffpL2V7AvV9I+IAgvUsH/hBPgFSwNkzW9TJKHwvRJljfoKlUufSMP6t9pDdj9edc1PmVNktK/pAYEOsce8uOiHlZJ57CJoNSvDJ3mIeiiUn357Hhwj8HboyujxzptSi7337lQfpqThdIbRPIBPg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(396003)(346002)(376002)(136003)(4744005)(6486002)(8676002)(8936002)(52116002)(36756003)(7696005)(86362001)(6666004)(2906002)(44832011)(6916009)(5660300002)(66556008)(66946007)(478600001)(26005)(316002)(2616005)(186003)(4326008)(66476007)(16526019)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 CZoDQxGTgiHKg7dCKgyaY76rbBqM7DEOEb6h/CHw6xpK4VOSxPOPZ2eyXABUwrWw+axOhSkVRWEL33jPJ+gPqtUwtsY2GMCOOFh8vy3dTwv2dNtNToDPOM53c1pBDd2599i2xfWlUt5sOcvYXmpg0/ENT93oJWRxQ/Qpu0WnAfUnE6jLsIYUw0mTIkZ/RpGGOUHAQZnTL/DOpKJV089owbqnLV/fr6ox+eA03lEePVYDXbqP/BO+NVlS5w54u7X+lUAIRCm6Q0vMh6f7peNx36Se7veUkIlj4TF3Z30sCvvHMidEO13LrCdj9HDCgRNVr7Ixq/FoeTWOK9wIRqkbnK0IvJyTUh5jQHgCVQfttZFbLLjRsgRy/Dh80qSPkPK4dJoS3ORBqNovyQlaDdx6cSv0lVwZjhcJgzzLcxxJKOPZespfZkvJoNndQ3qWR5pPPR8ovn4BDT3SOfagrTkNKOiNORc8d36iBTThrN+ikItouOvh+7DoHOg7nI65el8+41Tl/Lt5izXKHeW1GtIjGlXPt+RgUFmWS0JtKDeFPql+6f1jPIlTWQj6+UsR3UGDmW04pKiowWgQAsSDYJ7O/CLOhni+xHf5tbOwR1f4dvjSS77BQq3nmWxvwgICTwcNoz0Dxga3oltQ+cTaiWIBpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5527
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ed794f36-e175-40b6-3972-08d88002af96
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	y0Y5S/BnWgwqcnbZn09zs00CNBO6UXhDfpDhAukVtkJJql2QLCKN3iahIP/eOuNz3QG1pgFQISP/kH10+PFeyG0pEBHua/0zEkLukXQPCmBkdtGDHjf4CzxSIiJpnEkrnYVKeRsw6lzyOI1+Ru8YcVMIDY9enKOHVkKrhM5d3pnlw50vd6Z62pw+ngyJq2IViOi2qnr3jYsP+NnzhqPihZ8GFmprY6nW4MSJ84vf7lxo/LqO0pzFN4e8/SyeGdaAevo8ED0/ZJ6epk99GGMeYUKSepddYGmqZ5MLKZ7xkHsVAv/mg/bF7iGCNksnSqgf6FkCam9oAmD5oFi+mTpOxiol8T3F7N2WXqU3CG9GsmKkDz+38oA5GrjKg+AvuWKVmz0VYoDjgB63BzsZGxevaA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(376002)(39830400003)(46966005)(4744005)(4326008)(70586007)(70206006)(86362001)(47076004)(8936002)(8676002)(356005)(316002)(956004)(2616005)(81166007)(478600001)(44832011)(2906002)(36756003)(6666004)(5660300002)(26005)(16526019)(82310400003)(7696005)(186003)(6916009)(336012)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2020 14:14:09.2593
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7b357ba-cde0-48e4-28f5-08d88002bb3f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3018
Content-Type: text/plain

To reduce storage usage when pulling docker images we need to use the overlay2
storage driver. To achieve this we have to enable CONFIG_OVERLAY_FS in the
kernel.

Change-Id: I08e88bae41e353fc78c00e0d267a6009fbad1ca5
Issue-Id: SCM-1520
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../linux/arm-autonomy-kmeta/features/arm-autonomy/docker-minimal.cfg    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/docker-minimal.cfg b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/docker-minimal.cfg
index 7225c59..62b2d84 100644
--- a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/docker-minimal.cfg
+++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/docker-minimal.cfg
@@ -1,3 +1,4 @@
+CONFIG_OVERLAY_FS=y
 CONFIG_NAMESPACES=y
 CONFIG_NET_NS=y
 CONFIG_PID_NS=y
-- 
2.7.4

