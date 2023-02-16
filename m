Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49395C61DA4
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 11:15:59 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.44])
 by mx.groups.io with SMTP id smtpd.web10.7544.1676546153944376972
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Feb 2023 03:15:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=8Dp8iyjb;
 spf=pass (domain: arm.com, ip: 40.107.14.44, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qz83RlLZv0CV1VQS2db6tinFgHavO8MoyrlKiEK5fDs=;
 b=8Dp8iyjbLJa8p0dZyChG8EQtNWSAgY0p47q0CBaVGa6N5WH+kMKVCo5ZG5s/3G30mKeoitJVfsedmu7P4hWwdCXhFOSQXJo0azMhVJk9vR+D6wsytRJVsQZfTILSF4zweK8QbzlWncAZ3hORs8xEgPu9TmBJi4CfQWTWtYpGI6s=
Received: from DB8PR09CA0025.eurprd09.prod.outlook.com (2603:10a6:10:a0::38)
 by DB3PR08MB9897.eurprd08.prod.outlook.com (2603:10a6:10:43e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Thu, 16 Feb
 2023 11:15:50 +0000
Received: from DBAEUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:a0:cafe::40) by DB8PR09CA0025.outlook.office365.com
 (2603:10a6:10:a0::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13 via Frontend
 Transport; Thu, 16 Feb 2023 11:15:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT017.mail.protection.outlook.com (100.127.142.243) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.13 via Frontend Transport; Thu, 16 Feb 2023 11:15:50 +0000
Received: ("Tessian outbound 333ca28169fa:v132"); Thu, 16 Feb 2023 11:15:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 08f373875f054188
X-CR-MTA-TID: 64aa7808
Received: from d2d2350e70bc.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 06F5C431-3588-4648-A9EE-EAC3257B6A61.1;
	Thu, 16 Feb 2023 11:15:44 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d2d2350e70bc.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 16 Feb 2023 11:15:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ujh0OGl+HO8LqpU2WYINOxkDPxShKypjQ+j1Bps7KHrWTrEymnQHP5R9fYFx6+qUI0QHYO+wPQwQoDBHJ9mbR23xUYXdSZBYMg/sDis3C/o7gvph+UxKO18Un1vn2wLA6vswFn3e06lUO7iUAariKxYnyruM4SGuhsZEP3vpagB1n9o3opi5yTvDAMzPaIoDDLctwEQyB/j8I7wbx5zInkT+E/voTuoREMINeqe+GIedteqmq8rdVkSYkOaauSo7PpyNrhlt5sex/QD1jwPtsbYk0EuS6HnBEZDsUoctHoM5VKdg0KoG98beoACuRh034TAFSU2XETPhAq9R5yB11w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qz83RlLZv0CV1VQS2db6tinFgHavO8MoyrlKiEK5fDs=;
 b=TEnFXz4oCAy0F6YEB4effr91vF/y/AVKn51pweMw6y7CnGMtbM8Qhitpl5ourGYqr/aTIDoYXDYZc5amsAEwL/vHJIOGecPYpbcnM9uaHei+vZawWvSScdGbW4/LfoH761Qkztptd7SDXuVsuzrTEynPA4CHZJUzUezubGlCqpiuZW6HhIv5X31h93GhxyLs2aNJ2L3msLpeLnkG5gM5YG0MGHbkgASLYUVzrh6tFoKhoj4nXM+cLGYcrhLYpv7LSVWWZ3CSsGj4iWvFW64sqvwulBL93lUTUK56vPNd0rHJIbwslYXnmzaGMOtRGERElk9+naVBd2Ju7Vm3QA3DPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qz83RlLZv0CV1VQS2db6tinFgHavO8MoyrlKiEK5fDs=;
 b=8Dp8iyjbLJa8p0dZyChG8EQtNWSAgY0p47q0CBaVGa6N5WH+kMKVCo5ZG5s/3G30mKeoitJVfsedmu7P4hWwdCXhFOSQXJo0azMhVJk9vR+D6wsytRJVsQZfTILSF4zweK8QbzlWncAZ3hORs8xEgPu9TmBJi4CfQWTWtYpGI6s=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB9795.eurprd08.prod.outlook.com (2603:10a6:102:31f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Thu, 16 Feb
 2023 11:15:42 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0%6]) with mapi id 15.20.6086.026; Thu, 16 Feb 2023
 11:15:42 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH 0/4] switch from :append to +=
Thread-Topic: [meta-arm] [PATCH 0/4] switch from :append to +=
Thread-Index: AQHZQfWj0oQKxAfAzUOJBImyvcGnmK7RbAqA
Date: Thu, 16 Feb 2023 11:15:42 +0000
Message-ID: <9E6FF485-3D70-4176-A1D0-8D050DD4B867@arm.com>
References: <20230216105640.147967-1-mikko.rapeli@linaro.org>
In-Reply-To: <20230216105640.147967-1-mikko.rapeli@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAVPR08MB9795:EE_|DBAEUR03FT017:EE_|DB3PR08MB9897:EE_
X-MS-Office365-Filtering-Correlation-Id: ea97e15a-2127-4601-499c-08db100f290e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 MesoQJYC0ttAIsGg82M/TMw7JqF23GyCBZD7IZfaDpPmMi6/D8BSDRrfHI5WzFbUgtYy7uTLDr2IZ2M2MKFE9hA1iXF6feM1wHLCsh9u8qTfI9F5UOr3Zp73pSBEzml0/xpvuSqb+XoI+K7e+bAELgXehfM6gQoSU6w/BtB+M/6S5s7TdxWhLuadKVKyvlta+zRo+1fXlpAQxRAU+i8Sfm1JlxpxQGn9ZAlTpL1SqXdZO6PBaGtMRHUYjdf03WWe79NXUk1De9PuYNxduUs27vxIqhOXLEqFd9D1wlGiBzZi8fG3yIgScWtiQKOHM+ToaxxFqWPJrkgaWAHu91da8mwfDVY5rp2gUYcivqTf1Q+Vm/n8uHh5RK3XUFEHM1Y++1tCxzDPznG0gK9XdhZq+iig1KtIoFioDf5Xv/BhHgOJ/M3lHG4eAGWjYIOyGCQF7jWNVioibP/wW0pLyOURagRWmkysSoj+SAzEH139Mx73jko0Ci3l4+kk/3XVj2+/HRhUF2JlSl6IEeqTwdDdGFOegu88BjjeKnZmGJy1SsfwQhQnSM0IMO0TVdjsFBp8pvAt+a7ZBHiYDrU1CUx7CnDSy2v7jJH9gmBcf8GX13E23TrOk46Q6xmDfWMttsR/1MMcOEcxzgI7hrv4dask2hLPj7ZdBktYWpEj5SH9S/BfeXMbQ5hXMsJPIkKCzq8HqITr9hNEM8iNCRxpP+Qeq6CqZCH3H0Qn7FXhNM0WRzA=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(346002)(366004)(376002)(39860400002)(451199018)(38100700002)(66946007)(4744005)(86362001)(33656002)(36756003)(91956017)(2906002)(316002)(53546011)(6506007)(478600001)(71200400001)(2616005)(83380400001)(66476007)(186003)(6512007)(66446008)(38070700005)(6486002)(64756008)(8676002)(5660300002)(4326008)(41300700001)(8936002)(66556008)(76116006)(122000001)(6916009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D8CB82FF95B6F14DB54B5D271526A7EC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9795
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b90f23da-3cca-42d8-f61d-08db100f2457
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oKRSJu6EEBkcq+sFrLwEUx65laGwZekru/gvPyprMVWFuqe8H9J/gKRObFXdyJc9CEs9hxb2iioUea0lBeDws9C26d+E6uBtL2Vb8QL0npm0LKt+ZnRZ6KcFGfIi3OowcXlFfv8R2Ayv7TWa4w/NcR0wIzZKqrjpWZr4+svBtarVXj2vJm73pAaMKCDisNtW5+V0dlC5ko7kH1v2d9XLTpMmXHEfJe1zWSPMxig8Uo+MIRZX/Y96A/vAuobK4gqLrqghmMSF6BdmnsPjchHymntWw0w2xBPvRbTG1SDL2oYMUEJvKC4BCyFZN953DTPCj4s7xcthfbgSF7LmaXtS8CfPH82nSQU7lGlf/IhVKXdPLXMoYN9HwXzbcHAJnC7cJALgn704fAItVA18/C9R91BazGbMrZVqy9RvZCN37+1Tjm8OIxxZPiioFgoF1mKczX9RVEA0noiwvDyjeb5WCPppLkvMkl/XpXgzsixyf2KPrSkEDd9NOO62mWbFTMNMbO7X+U653c1pIT+WhZfWim2VsznLfNdxiki5SckMJz6FtigXVWbKV+xO9z/DzClQGXHy7LJSb5+bjZapaZ7Gpxzn599XWAm6rgV48iBlcfspfWHUnTrUmBtEY2Pahj6vMR+/TLAB/ZYHevSt1RMHzkYTRY2cMGZ92EE32z+rPT6IBcsFssn/Ja6K0UZp+iNcVAQLtKmO3LLN4pZOoCpnMQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(346002)(39850400004)(396003)(136003)(376002)(451199018)(46966006)(40470700004)(36840700001)(4744005)(36860700001)(82740400003)(81166007)(2906002)(41300700001)(33656002)(5660300002)(6862004)(8936002)(40460700003)(36756003)(336012)(316002)(356005)(26005)(6512007)(6506007)(70586007)(4326008)(53546011)(2616005)(86362001)(8676002)(70206006)(186003)(40480700001)(478600001)(47076005)(83380400001)(6486002)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 11:15:50.2256
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea97e15a-2127-4601-499c-08db100f290e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9897
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 16 Feb 2023 11:15:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4404

T24gMTYgRmViIDIwMjMsIGF0IDEwOjU2LCBNaWtrbyBSYXBlbGkgdmlhIGxpc3RzLnlvY3RvcHJv
amVjdC5vcmcgPG1pa2tvLnJhcGVsaT1saW5hcm8ub3JnQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+
IHdyb3RlOg0KPiBUaGlzIHNhbWUgcGF0dGVybiBpcyB1c2VkIHdpdGggYSBsb3Qgb2YgdmFyaWFi
bGVzIHNvIHRyeSB0byBmaW5kIGFuZCBmaXgNCj4gYWxsIG9mIHRoZW0uIEhvcGVmdWxseSB0aGVy
ZSBhcmUgbm8gcmVncmVzc2lvbnMgZHVlIHRvIDphcHBlbmQgYW5kICs9DQo+IGJlaW5nIGFwcGxp
ZWQgaW4gZGlmZmVyZW50IG9yZGVyIHRvIHRoZSByZXN1bHQgdmFyaWFibGUuDQoNClRoYXTigJlz
IGEgcHJldHR5IGh1Z2Ug4oCcaG9wZWZ1bGx54oCdLg0KDQpEaWQgeW91IGp1c3QgYmxhbmtldCBj
aGFuZ2UgZXZlcnkgOmFwcGVuZCwgYW5kIGRpZCB5b3UgdmVyaWZ5IHRoYXQgdGhlIHBhcnNlZCBk
YXRhc3RvcmUgaXMgdW5jaGFuZ2VkPw0KDQpSb3Nz

