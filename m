Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77ED0C433FE
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 20:44:34 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.88])
 by mx.groups.io with SMTP id smtpd.web10.461.1650392655909709027
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 19 Apr 2022 11:24:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=GUsaj+Sb;
 spf=pass (domain: arm.com, ip: 40.107.20.88, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdOzLW0kWpFkSdB9bjOxRKEbEimCElCYk+7cD20scgE=;
 b=GUsaj+Sb2e1oI1+sNl68Aly56H9WB9X8jFfCc7+xILDhlAFRweu7DN4AJZnBI1AyFu5MEUP/AdIQprBZlUMUouKzyHP5o3AhTsdaHr6O6GkJYCsnKxnhE4s7GPZeVV9sQDPrs8uVnLwcBUCnG9T8jOZ/aftW2dq8rUooFu+L4co=
Received: from AM6PR04CA0007.eurprd04.prod.outlook.com (2603:10a6:20b:92::20)
 by VI1PR08MB4237.eurprd08.prod.outlook.com (2603:10a6:803:fc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 18:24:12 +0000
Received: from VE1EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:92:cafe::dc) by AM6PR04CA0007.outlook.office365.com
 (2603:10a6:20b:92::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Tue, 19 Apr 2022 18:24:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT047.mail.protection.outlook.com (10.152.19.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Tue, 19 Apr 2022 18:24:11 +0000
Received: ("Tessian outbound ab7864ef57f2:v118");
 Tue, 19 Apr 2022 18:24:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b5da2d39045f5ed8
X-CR-MTA-TID: 64aa7808
Received: from 43c056682fab.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C85111BD-D86D-4370-B309-471B310679C2.1;
	Tue, 19 Apr 2022 18:24:05 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 43c056682fab.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 19 Apr 2022 18:24:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MxWbEXER1Lsq6O4zB0bUYatpkjR4WDIqzLin7qG+/ImZSNg76Wb88wikimhqQwUYMmRBH5ynLYbgfNYPKZuJiNklCrXbw4r61xbhCIvFrd8PhugioytZQJ15rT3hMCxnEq7lJYCkUZ/DZpMUAr/gASnql4+3yUwdon/iZdhIoIWQKS7y+SIFUq47Ku6DMTPl+MUTp73ur8MvDqwDoeiPv4iPHM4UzCV0KH7KGxOPp5RpmbXgwWWi5pKGrL9xNkKsGXx8TH2aqhvSJpQEBEGuEuYzKwt5KsbvdI+j0uObwdKlUqy+L69Xw0p7JKwa2mQYGcdvH+OIQLyssxdqEEWosw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdOzLW0kWpFkSdB9bjOxRKEbEimCElCYk+7cD20scgE=;
 b=cwXCnnMWEE4DGRAQkjpFLP1MdLsniXg5ffhp3R4zTeZZCL5PnzmMQaGxX8Dadrbl8dtFWbEfQKLpRtQxir5mMFl2wk6W46WldOckpo0txqQox+b2cAddwu9KjwbF/MFLaFQjPlRnDfeBMdsFxTCb3eI3laAGgFKLZ4TBAMHTkpMut5/eAmWrv3NpHeYuFz07B0Tbg3gx84Y1sMl30/oZm3CK3Xb7hl+6u0GzaiTEs+5lcg9XJ6NA/2RRmRd58qgClXg2BVBlSScZgJ6dYptMhit0tAZDvSZG6mlafXts90XBVg+fumZJT5YnFQuc7Y/o+4BzCkhmwD6T+epw+jv0XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdOzLW0kWpFkSdB9bjOxRKEbEimCElCYk+7cD20scgE=;
 b=GUsaj+Sb2e1oI1+sNl68Aly56H9WB9X8jFfCc7+xILDhlAFRweu7DN4AJZnBI1AyFu5MEUP/AdIQprBZlUMUouKzyHP5o3AhTsdaHr6O6GkJYCsnKxnhE4s7GPZeVV9sQDPrs8uVnLwcBUCnG9T8jOZ/aftW2dq8rUooFu+L4co=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VE1PR08MB5103.eurprd08.prod.outlook.com (2603:10a6:803:107::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 18:24:02 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::8af:d35b:6628:5013]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::8af:d35b:6628:5013%6]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 18:24:02 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Test Mail
Thread-Topic: Test Mail
Thread-Index: AQHYVBqlCclOYRwu1UGkWdXhVn6Dfw==
Date: Tue, 19 Apr 2022 18:24:02 +0000
Message-ID: <BABE817F-4B1C-44DC-BC60-B1EEE483C852@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 313361b0-272e-4188-356c-08da2231cd55
x-ms-traffictypediagnostic: 
	VE1PR08MB5103:EE_|VE1EUR03FT047:EE_|VI1PR08MB4237:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB423748EFAA9B403564B20235E8F29@VI1PR08MB4237.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Tk0W6dZZRW75SD/dNO/M20N4GlNmy1Fmqqo7K2Fi9RRRRjN/WWBS7dZ+kauerCmICyEqNu0XGphG4WcPMEaKkI49cMGCMho5QiveM4U+4dZv519vtsDovTfBzzSKSmiF2DEjnzpIp5iIWrOg/VPA8tlfEZRStSLx69d+adHzRigg2ddUdqB3AgLcj5p/8LXmlOCZDKgLxaylMftbUW+ba/yHGDnIUxqtdd3DEX1kH91EMRF9+6EnZAzH/I27tNRyZyf0DypJymxWOvneHl1TnAZxg+fHyH7e0yxreySlb6XGcXVmGCDy+Uje/KMQuQYCYn6MEZelU0O+wH+Crh55j0LbjeUEMVq/U1uB7Td6L1bNxjeQKvoB2uTVjtEJv+yp3iTnKowPGCuPaMEGiSuyDDyAtyy57+/truyDgiYFEWUfl4P5Txet9rfre/g3mGlRRkpL0ia7Yr4vZWw4Qt9K/Hi+1+ft3OIi0oDH1jqWYMru1/UppWm5FDAcEjZ+Tx1m1BOfXvx66FFQFWNqpfJKWhJHVv8hTSOrHHT4MUFcFoaB+XXfeExOMZgGfm5F7CXnql9SVGTGXW8j9/O93SyizT/YCVFqrMnMutzmcGrcyca0EJNkeTYJm90wAwoj3xk/H7cI8U0zQDiWraT/jwEJnPWfuqkVzvsyMz8GVRSPKVFaF081gns/pOeZyLgdG5YpZIPsoK4GLht3xC2UseAU6IJC1ZMAuKau7vK/g4iFj/I=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(498600001)(6512007)(76116006)(2906002)(71200400001)(66556008)(558084003)(19618925003)(8936002)(186003)(33656002)(5660300002)(36756003)(38070700005)(8676002)(91956017)(66946007)(3480700007)(2616005)(26005)(6486002)(86362001)(66476007)(66446008)(122000001)(38100700002)(4270600006)(64756008)(7116003)(6916009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BD406DEEDF6D6848AD333FD74692096B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5103
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5a437df9-1d67-4322-e6a5-08da2231c7c2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yJaEprwW2WNXwmDvmcwgIMkKLNhUBeIDGRci89jBdk5ttsJvcaJW5/OLjhslQzuGTvpx/xhmfpEge/071XtI+Wgl55RhzEn0vhvmpSj8XgPP35HkBkiudyyYaDWPlOreTScd6kCc2StUwRvZFZavWsDiVO2Bk+ymqS+Xsj+tlyVXlBYG4Crmmb7hE44xcISZoQAibDypLbkwRxpcisHY4ngTg716jeQ5MAlUhiPGdtzzOagFVgnK8xdjGsVN3TOKDAlFLoCBJgHp+aiCrlh4Prmqk3hzqnEDvcbbA7eCMwFdo+NWvVj/qN5YWW6JJXjlX2FFFGwCicVIcWS7kfTFxa3i+j2vv6wcMAFsdvfznCN28qL5mIRLIyfKdo/nvKXqIAYH8S85I83RAdwzi51ekOhSmf8Sz5GoDswXEjjojoy/bkkXjYI+lNJE3NoCdmdWCjHObgYCgA5pTlPKNlQAYHCQC5kXafe6Xe/ybIGnKCki6tHA8ilqV9P8CcU/ccyt3BVlv62L9k+JhMguiRepAALSNqHv1Go1DXB2paEE61O47/Bv9HMxPjHB4WCJQlzVMefqHBWLCZ+JxX3swB0CxA8bfVjBJ4B4uv1nStbnUglAaoD+2OL1dwkDdMOZVUYl5lPJ0CWGGsPoM2pIIcaQyjzmZ8pJg4rGEsL7tk7ZCC9KdPmzfmIcr7d+vL9K/cfr
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(6512007)(508600001)(356005)(19618925003)(81166007)(33656002)(316002)(558084003)(8676002)(70586007)(70206006)(6506007)(36860700001)(3480700007)(4270600006)(2616005)(40460700003)(26005)(186003)(6486002)(336012)(2906002)(47076005)(36756003)(86362001)(7116003)(6916009)(82310400005)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 18:24:11.8751
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 313361b0-272e-4188-356c-08da2231cd55
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4237
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 19 Apr 2022 20:44:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3276

Please ignore.

Ross=0D

