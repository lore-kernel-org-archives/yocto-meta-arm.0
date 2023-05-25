Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 192FFC7EE2D
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 11:41:39 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.67])
 by mx.groups.io with SMTP id smtpd.web10.9563.1685014891592928093
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 25 May 2023 04:41:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=3axJgA+m;
 spf=pass (domain: arm.com, ip: 40.107.6.67, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJsmmuG/++zcpVwUqx51e0QJi5x2fV4QuvxSGUnXH9A=;
 b=3axJgA+mJnjv1TBno7WN2zfPRrTv6ajiAos5Av/sGiCAleqwQnU1oRueh8gONb562Wt3siZHI4vHxjBW1Yz3Tpc6ISfdC5fEFD3BkArEnaqOR1EvKFr3pCARxq8Pg35LHdK30Ew003VFp+s0lFj2OqTfnS0ESzH3Ip8H8OOilzs=
Received: from DB6PR0801CA0066.eurprd08.prod.outlook.com (2603:10a6:4:2b::34)
 by DB9PR08MB7625.eurprd08.prod.outlook.com (2603:10a6:10:309::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Thu, 25 May
 2023 11:41:27 +0000
Received: from DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:2b:cafe::41) by DB6PR0801CA0066.outlook.office365.com
 (2603:10a6:4:2b::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29 via Frontend
 Transport; Thu, 25 May 2023 11:41:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT037.mail.protection.outlook.com (100.127.142.208) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.16 via Frontend Transport; Thu, 25 May 2023 11:41:27 +0000
Received: ("Tessian outbound 3a01b65b5aad:v136"); Thu, 25 May 2023 11:41:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ef40decb16f93574
X-CR-MTA-TID: 64aa7808
Received: from bbcdf8412d66.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D6D9A865-FD47-467A-A19A-EDC79BE149CC.1;
	Thu, 25 May 2023 11:41:19 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bbcdf8412d66.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 25 May 2023 11:41:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WueQJgqVLUx50opVTQXzmq7tg7578+oN//fvrAySm4WyCG7UTq+efLRD+74RzpIVGyVRxMArAUacBi1kiXSZe4DtGJgSXAX3rZk835xKrpBUWnDiSCVEjYR4jIgsm9iteNHWpnNTrx1yiOaq5FGHSRDmmAyofS0HBAOrI+YZGrqSaC2uUA7AYQvm42rx2ZhYMAp0gSnyuW8aTKj8q6ZCk1/V214KQO+RCL+bhM4O0ADfHtrDW37Ft//R6M2Q6XB3oDQd5VHXQi8qy/XiRuNozMj2C9atJ/o/I/uiNV0WJ/kP18gP5Y7l3fiH0emKWtYjq2V/N1M3W3bIBGNSmA1eWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJsmmuG/++zcpVwUqx51e0QJi5x2fV4QuvxSGUnXH9A=;
 b=TomkhJSv/BSv4Ma+J++k2EUvIIzECTEveGB8sWq3Kos/rBLj1/F76CT5w++uFvgkbvqJKZQx73/eBF7OXKDF68Z/ZGoE0z/rUzapz5Zd9JvhZg2B/roI57S/TxLgebAbNAPp1eCk67bxy5DgU5UqCv0QIaejjAWyW1yKvuN2qFIR9wGdbRHHtiPrfy/xcMlTVd84x8NM4amTF4gxSEvQNxXBfXJjRfZAQhY2VI1H3fiqfZKljpzQWWegKa67bRiFrlRzfGSkwyIKQ3FTG58l/15rH+zWHnMNuLaayDFjJWx/Md0xp0s2GCYUtka/4mHa2+TIzlKGYJXpAnrZZ6+HNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJsmmuG/++zcpVwUqx51e0QJi5x2fV4QuvxSGUnXH9A=;
 b=3axJgA+mJnjv1TBno7WN2zfPRrTv6ajiAos5Av/sGiCAleqwQnU1oRueh8gONb562Wt3siZHI4vHxjBW1Yz3Tpc6ISfdC5fEFD3BkArEnaqOR1EvKFr3pCARxq8Pg35LHdK30Ew003VFp+s0lFj2OqTfnS0ESzH3Ip8H8OOilzs=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB9482.eurprd08.prod.outlook.com (2603:10a6:102:318::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Thu, 25 May
 2023 11:41:17 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 11:41:17 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
CC: Jon Mason <Jon.Mason@arm.com>, "meta-arm@lists.yoctoproject.org"
	<meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH 1/2] arm-bsp/tc1: use latest kernel and u-boot
Thread-Topic: [meta-arm] [PATCH 1/2] arm-bsp/tc1: use latest kernel and u-boot
Thread-Index: AQHZjll2P+nYAfI5rkyKcEwRj8IXKK9qjcgAgABRGgA=
Date: Thu, 25 May 2023 11:41:17 +0000
Message-ID: <622A1046-789F-4136-8EC7-86236B586325@arm.com>
References: <20230524160237.3275001-1-jon.mason@arm.com>
 <ZG8FSrcpwwgRi/+D@nuoska>
In-Reply-To: <ZG8FSrcpwwgRi/+D@nuoska>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAVPR08MB9482:EE_|DBAEUR03FT037:EE_|DB9PR08MB7625:EE_
X-MS-Office365-Filtering-Correlation-Id: 0349bf29-9781-481f-10ba-08db5d14f9aa
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 +ddZ31AHhZyY7pggMgAYZ8H4iupIA6hYAHp/Cx5i0HfN+auXsrGGL5y3R0NYrA6e+PPCxE8cyEiraunc0ymse13cpfFG7VJtEm3noMHJwtDUN6aIwqRUrtb+5uYhE6BZJThcNYbVxz5sDnnxiEYLK7Qdbeyq1pnZbsq2/aFatXnOqCSVFMeKkBHFVPba9CfREVas2NVDSvvUIkxV3WKWYGka4S1ZkVvDihlUlYZhX2f5XMJLMn8B5b89eHV7MlL8Grou/X9+xFz5a1KAlqYBl93zC85VJg5noVaBflYoRUyNPhAQaEvJVdYQxIaWtlUd3pBHQctdLTqN/I7thN5A6R+zQHAQLWD35c0+DL/zeOkU8lKSLu6PwvAmA+1uf7LSFcsYcIE4pCwFMiI52wg5N5yh38aypoPpvWPq/7iTi6QYY/kwxpSEcsDLEMOo1ezTLw0MO13zNhaSWUTlThDy6dZ9y1pX0O5TjcBZl1O0NV+/J5RlTj2QCU3G883L6FskfGOGa0h4elmccfjqOQqXz16DzakI0lgGw4npqvUuljlNn3mgPwW21dE+/OFux7f1Zct6ASNZClBn9a0Vhjl074n3/Y7GHA9949fHMAxi3e3/2Zizno3kcbTwbnD35bKcRPjkD5N5fC2RUcIH8WFHQA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(396003)(366004)(39860400002)(346002)(451199021)(8676002)(122000001)(38100700002)(38070700005)(54906003)(91956017)(64756008)(66556008)(66446008)(66476007)(76116006)(66946007)(478600001)(86362001)(4326008)(6916009)(71200400001)(33656002)(41300700001)(6486002)(316002)(186003)(36756003)(2616005)(4744005)(2906002)(5660300002)(6512007)(6506007)(26005)(53546011)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7446DE03CD60224B83016BC5A886058F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9482
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ede5619d-711b-40d4-3ec9-08db5d14f3d2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dkcUeyrpnRMM5hRMQF0qceVEBT6jKsW5r/p4nVjQ+tW6k2sS6oMYwKk0STAxHlm83M/ixLFZ6/B2S7WBTttBntBpSlJ/N0gP6lwg5nSHcmBP9BTd06lD4sYK/cMk0uQy2pSFE2+GkzGca+I6A14FAkn9v1vQO8mNlUpPhV2ZJ4f5f84Fgdg0xUB8YOQ8rodod8n4ZgOipuBSd3Q5wAjbHUgLd42WDGA30PTXh5EvarMsP2j7jBZMNdLRLVcWMLDY/gn6PCTwc4fxoyxU9cd5h/DWangTGKd/J5pFjwm9TKqCKC6h8AN1GXY3GZGYI/0Q6LQ8uod9Qm+jIUxnoiV7F3/2FjjWi+o4RL/HMDA0S2PL+ZgJD/+rRJspAj+eRkXQ2crmtoiX1LI0tUkY0B0lr4aYp8o9MRnAVYt5yKXeVTiGklsZnbGE5EbBre7boRRP6S75cJQrtx3X25pP3FKJFnO2lotO6MptPMxXMcr3MwV2YpkcJopvSbjSP0H3AylGV+VFze0VYQ6PXtF3+2hDXoxZEpvbBMTq0twx8srg7ygV+xERbC3lyvkdYwsn9jxtojFRmlBV/ijOCP0Nyw5hVE3tSKmfoEuqOh25iOo1gnb85vbuyWCXLf+YjLf5Y+ztpokR6+JrevQBi+Wm+L2gx4FjgRx1RO8rtSPW1BLZ8qI8992y2paK4X6c5h2ehS4b3iqjSgBoobyrrxdgrW0KpkZLxbSTnqGQMMvptLzqXhCfu7ACxGEm+Iy/hPtNunyN
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(396003)(376002)(136003)(451199021)(40470700004)(36840700001)(46966006)(316002)(33656002)(54906003)(4326008)(70206006)(70586007)(6486002)(36860700001)(41300700001)(478600001)(82740400003)(356005)(6862004)(8676002)(5660300002)(86362001)(40460700003)(81166007)(8936002)(47076005)(6506007)(40480700001)(26005)(6512007)(336012)(53546011)(82310400005)(4744005)(36756003)(2906002)(2616005)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 11:41:27.2302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0349bf29-9781-481f-10ba-08db5d14f9aa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7625
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 25 May 2023 11:41:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4702

On 25 May 2023, at 07:50, Mikko Rapeli via lists.yoctoproject.org <mikko.ra=
peli=3Dlinaro.org@lists.yoctoproject.org> wrote:
>=20
> Hi,
>=20
> On Wed, May 24, 2023 at 11:02:36AM -0500, Jon Mason wrote:
>> Drop usage of the Android kernel and legacy u-boot in favor of the
>> latest of both
>=20
> Which u-boot latest? The poky 2023.04 (or 2023.01), or the meta-arm 2022.=
10?
> This patch removes 2022.04 from meta-arm.

Any u-boot recipe in meta-arm-bsp is a stopgap measure until the platform t=
hat needs it has moved to the newer version in oe-core.

So, this moves TC to the latest version available in oe-core.

Ross=

