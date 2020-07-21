Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.77])
 by mx.groups.io with SMTP id smtpd.web12.17677.1595334094708753905
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 Jul 2020 05:21:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=xdI5+l3j;
 spf=pass (domain: arm.com, ip: 40.107.14.77, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DxGlvcftSkj9sZH5E/744HavZibDtucs+yHSYz1Eq0=;
 b=xdI5+l3jqhgxrKZ4S53dFd2vHtiZcONT4bcqRZdm/UF++opx+KpkmbTX8iLMSbCAFPRCC138Bt4OLGt97tv7asJkrWAsJqPYo5bnD++zq20BZ1FpD8kgFvb3eVAD1i4ieQX/Zs79nT4dhW0OPD1bJiy4G6m6QKNXyIJ2EkM+CWU=
Received: from AM0PR03CA0037.eurprd03.prod.outlook.com (2603:10a6:208::14) by
 DB8PR08MB5162.eurprd08.prod.outlook.com (2603:10a6:10:ee::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.24; Tue, 21 Jul 2020 12:21:31 +0000
Received: from AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:0:cafe::a6) by AM0PR03CA0037.outlook.office365.com
 (2603:10a6:208::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18 via Frontend
 Transport; Tue, 21 Jul 2020 12:21:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT018.mail.protection.outlook.com (10.152.16.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.18 via Frontend Transport; Tue, 21 Jul 2020 12:21:31 +0000
Received: ("Tessian outbound 7de93d801f24:v62"); Tue, 21 Jul 2020 12:21:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2699a06cf5b82091
X-CR-MTA-TID: 64aa7808
Received: from 95266462cd4c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9FAEDF86-9483-4C24-AE69-8E9766B11B9A.1;
	Tue, 21 Jul 2020 12:21:25 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 95266462cd4c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 21 Jul 2020 12:21:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U758UsgEar8JqPf/XZeVDO/LgHm0qw2i4LkZQiLF4D2vuGZqWcBXNkZiNWxR+HXHNVCvgUNOO9fyGMu50YwbQ8jmVzKhAc2AkYcAdsrjkcKjwFQMQMPFnpD7XmQZecp449lhgjatyMut8Tb2TYSneJrD6VsIMPVbBx5G86HHAvgyJKSf6eVEUXTKRC8hozenZ5bSwFrteO37oEs32QY16U/Zx/kFNndQYOCd4VhoNXmeu5o8PkpT9CfOvXmhpAxADr5xUoM+Bf2MFZpCi+SaDq2prSDE8hv0oEjsZgQibVad4VJcpbRp6m0goT3PRpcE+XKTMqnx3orjxXLhmSFw9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DxGlvcftSkj9sZH5E/744HavZibDtucs+yHSYz1Eq0=;
 b=RR0zaLCY+mHYlSjmzoHEj6fIpfk6jcVRXrrM6OddWc0Am0U9NuWAHjXa2kSJs5ItAUCI1tFhjgrBXn+cKWF/WjVZq+3h5sbYpRcAcwwb2+kAB38rPuSkwwxeFtQ9uY+/4hAKYSHv/vvgk+se+3lUPEHyDS8AGRa9C573p6owoPPILHFcza7AquUH8meGbuiPxB6yamMyHOiC5Lv80CfHVrgvZx7wijNJsT0uYxQtANRJ7CPjSOfWmR+aL/4v8Rp2ZoLlZi2hGQNdT4IZmIFOKRniSc1d6Jj/kItYP+CE8mjidW0GG9SGu91c7Ol5IYm/8+1I1kHfuT4PxiOSr0JZKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DxGlvcftSkj9sZH5E/744HavZibDtucs+yHSYz1Eq0=;
 b=xdI5+l3jqhgxrKZ4S53dFd2vHtiZcONT4bcqRZdm/UF++opx+KpkmbTX8iLMSbCAFPRCC138Bt4OLGt97tv7asJkrWAsJqPYo5bnD++zq20BZ1FpD8kgFvb3eVAD1i4ieQX/Zs79nT4dhW0OPD1bJiy4G6m6QKNXyIJ2EkM+CWU=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR08MB3998.eurprd08.prod.outlook.com (2603:10a6:803:e5::27)
 by VI1PR08MB4382.eurprd08.prod.outlook.com (2603:10a6:803:f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Tue, 21 Jul
 2020 12:21:24 +0000
Received: from VI1PR08MB3998.eurprd08.prod.outlook.com
 ([fe80::11db:3970:9cc8:8d74]) by VI1PR08MB3998.eurprd08.prod.outlook.com
 ([fe80::11db:3970:9cc8:8d74%7]) with mapi id 15.20.3195.025; Tue, 21 Jul 2020
 12:21:24 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-autonomy: Extend compatibility to gatesgarth
Date: Tue, 21 Jul 2020 13:21:22 +0100
Message-Id: <1595334082-41274-1-git-send-email-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: LO2P265CA0470.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::26) To VI1PR08MB3998.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.51) by LO2P265CA0470.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a2::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3195.18 via Frontend Transport; Tue, 21 Jul 2020 12:21:23 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.51]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e3977b0f-48cb-4bee-b3ac-08d82d7099b4
X-MS-TrafficTypeDiagnostic: VI1PR08MB4382:|DB8PR08MB5162:
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB516256C663C270473146206E92780@DB8PR08MB5162.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 M9jesRexxkQjNrn70iSWPyhEf96Cw/bMJoMppUG1WOVZyAviXx/plvtWSDygFrswxw6YPfuHkFc8XALZvrJ90jEGuIQDDAunYqwWGGt3BwJ2PeRn87YYt3StD3Au2NcPgEtxZR1uxBC2Q039D0jJ1XoqjeBfHUTj4+zaUvaShRRcp2ZGFLkqbjd8ffyjxPxiZRw+4aET8Pxd6rViDMzKt8w5Lt020mx69DE2YQFfGsAfJ9+LjaFfR1IEjkEDHLocQ7/XL4BCaH8JM6skQXiDN4xYseEd2nVHwzYqls/vtUIY1f7DQdiUqFrNmwHzuYxIcMPzY4y+nyuqmWQnittexA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3998.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(39860400002)(346002)(396003)(136003)(376002)(7696005)(316002)(52116002)(4326008)(83380400001)(186003)(16526019)(44832011)(956004)(2616005)(4744005)(8676002)(5660300002)(66946007)(66556008)(6486002)(26005)(6916009)(36756003)(478600001)(2906002)(8936002)(86362001)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 CSNULNejQbxvwJjKNvxP+gBFSBWH/tlYYYFi36GCRWT9m6qi/bf3rXPmBKvFMZhU9XrdAP4ZD/SK2OgFUabssDCniubw7oXW11usYkDuYY4HEwc6TQHDB+xxnq6z+BaIaILrBHuYo/teaEvm5XTqWQIL5PmS2j4+hXOy/zhvQ2pW0xarvyhPCostS+RG6V4s9JpjyKVwagb+DzW+7wwtKDAzu07pydXwssnmhvKzHW/lCyYXvGK4Xgp7b7imKGVx1DSr/uYyJKghB/udJ8EqK7EWFbrjJTXyyQepBd9mSSk8m53Km9rI+Zuhb17soisL4bXav6/C9QktLVANg1DWovI9YaorWWQ2UyYGbAZVkBnh/PjfQhsUJ+q22678Zlrefmo6gmeKwp5CuCUyco7ehI+gWoSa2YYrAmNkmrMJ9UGOsGVAxqIQKpz4Ct6OQIQz0MZQ78lwyU52Tj7YG/8Lu3/Bt0hBCJFyYn0oeqPm/Gax4QNII0jcYC3ey81wB9ON
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4382
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(39860400002)(346002)(396003)(376002)(46966005)(70206006)(6916009)(5660300002)(82310400002)(8936002)(356005)(36906005)(316002)(83380400001)(81166007)(8676002)(2906002)(70586007)(4744005)(478600001)(4326008)(2616005)(86362001)(186003)(26005)(16526019)(44832011)(336012)(36756003)(956004)(82740400003)(7696005)(6486002)(47076004);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b451a553-bafe-4d4e-1d6a-08d82d709536
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fc5yNKy+Z77Y85iSRJtKo4JXvE/0QvZZjq8hSqxj7XnsQjCbma8jdGHteFj9XutPllmSmpqQlqbsfJWi7X+DTc/QQ+Dy8AJtLT5wlydiFLD59PcNC89oGTnMQvQC2KfG2nHwpjRBqyl8t4JPMoSIkHqdIkJ5wgMsdymGfvd4OFheu6p3DKjkenLXtgIAzUgyy+jCdHkE1AQFLSJoChL0cN965iEC5TqLm83CaPNc7//nZKQ84neq+Dty1z0NUF46xW7A0oBve7kpUvT0Zw8/SGbEeHgkJwUQb45DEBmTHSwRoxmFb9XhcOasCQB8CeIJUPl5TTCzhBJFsGIIF49ORTOdqSGmA4tJff+36baMEUBPKyW3LkvoM3efSDSfIS0FWur+8i7iffH3qNhSosYmUQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2020 12:21:31.0659
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3977b0f-48cb-4bee-b3ac-08d82d7099b4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5162
Content-Type: text/plain

Change-Id: I38c688f0b50bdfc8abc2119821977755dde33cad
Issue-Id: SCM-1065
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 meta-arm-autonomy/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-autonomy/conf/layer.conf b/meta-arm-autonomy/conf/layer.conf
index 739dc81..5c13596 100644
--- a/meta-arm-autonomy/conf/layer.conf
+++ b/meta-arm-autonomy/conf/layer.conf
@@ -16,7 +16,7 @@ LAYERDEPENDS_meta-arm-autonomy = " \
    openembedded-layer \
    virtualization-layer \
 "
-LAYERSERIES_COMPAT_meta-arm-autonomy = "dunfell"
+LAYERSERIES_COMPAT_meta-arm-autonomy = "dunfell gatesgarth"
 
 # We don't activate virtualization feature from meta-virtualization as it
 # brings in lots of stuff we don't need. We need to disable the sanity check
-- 
2.7.4

