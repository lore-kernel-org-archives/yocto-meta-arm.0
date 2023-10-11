Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19DE8CDB470
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 17:28:53 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.78])
 by mx.groups.io with SMTP id smtpd.web11.22831.1697045322466629942
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 Oct 2023 10:28:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=FD7u+TS7;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=FD7u+TS7;
 spf=pass (domain: arm.com, ip: 40.107.13.78, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nWAS9Jvs+jp5JthIVJ7Ymn/TTLwqkXCM30E3XMc+2yk=;
 b=FD7u+TS79FrZzIRvlIpTvHdTUgF1W6nHNJkJCRDmz/OBLiOTRHvRW77+B3izpmWJ2yqAgS71ugd7c/ivBUThuFk/MO4FBI3NUxHjzKYlG7nkOS5DaPv9UNf9Ht1nRk5OlrTN5WG0AG7oUfJpYnyBmp5Soc7YSaSPyno1ToYX3as=
Received: from DUZPR01CA0061.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::19) by PAWPR08MB9566.eurprd08.prod.outlook.com
 (2603:10a6:102:2e0::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.43; Wed, 11 Oct
 2023 17:28:38 +0000
Received: from DBAEUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3c2:cafe::77) by DUZPR01CA0061.outlook.office365.com
 (2603:10a6:10:3c2::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.35 via Frontend
 Transport; Wed, 11 Oct 2023 17:28:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT029.mail.protection.outlook.com (100.127.142.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6886.27 via Frontend Transport; Wed, 11 Oct 2023 17:28:38 +0000
Received: ("Tessian outbound ee9c7f88acf7:v211"); Wed, 11 Oct 2023 17:28:37 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9f8908e1bfc8a16b
X-CR-MTA-TID: 64aa7808
Received: from 022648c7fd0d.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B451AEA4-DB7C-43C3-86D9-4D9DCE9F694A.1;
	Wed, 11 Oct 2023 17:28:31 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 022648c7fd0d.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 11 Oct 2023 17:28:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGvnMJCFwyXQpF03SnbRehIUNS5oCKfd5V60P1ruZiyf7gsa/S5yTXj6x5UuLw/vC06HphMe5kWsfIqLa/oNVI5Ri9IM/VH2wwHIUT03p7Ve4ayEkErNBjNkFYmlkEzPv+Eg8MNrQifcJkcDIhMpQShN66HVg+vgmmNc+KmO7Ubl7ysGmzWCsH0y/8ya/ZVa1yG9Bb6GW4YdFDCGiX9JSn36MWsJNeNGOaamUQepoNEfgnxa6VZEsd2P757Z1cDCENkpSw1UJpo0R8LZ34NdjPNFd5RwTWz64veohzsJuJyE/IXTysPYrmZY8MZur49z0OxCaCZPkB34iz7adhWSYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nWAS9Jvs+jp5JthIVJ7Ymn/TTLwqkXCM30E3XMc+2yk=;
 b=cispDcbr6gFOudrAtWEcNInUbIRxp1o9ECJwiU+hR3QhIPddwiOyo1J20BGfW9BaPMTxh8Lx6J8DA5pK9IOyvKbFYIOOPYld6wnbJECc4Jd6UfV0KXSv8AJpjtapcCSZMnbC03tcrgMch0nSum0PRZE4xTgHMsB+NgFt0GwEoDuUBFQP6cDVcltORbAdNUpkUO5CGBwZKfUXNAn8lFnAd+UOSffA6BdFnbVjgmXpDxgmV6EFMYNcqB0xClI88RlKlxFPg2GCO4de/Pf+EsbamwIk0O9Johwd84MiLz7BWXGqlNsqkxIEeQvDbspSw7sL8YXmZDLIyJArtUNjMZB8RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nWAS9Jvs+jp5JthIVJ7Ymn/TTLwqkXCM30E3XMc+2yk=;
 b=FD7u+TS79FrZzIRvlIpTvHdTUgF1W6nHNJkJCRDmz/OBLiOTRHvRW77+B3izpmWJ2yqAgS71ugd7c/ivBUThuFk/MO4FBI3NUxHjzKYlG7nkOS5DaPv9UNf9Ht1nRk5OlrTN5WG0AG7oUfJpYnyBmp5Soc7YSaSPyno1ToYX3as=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB6118.eurprd08.prod.outlook.com (2603:10a6:20b:29b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37; Wed, 11 Oct
 2023 17:28:29 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1817:56f3:7623:c4a5]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1817:56f3:7623:c4a5%4]) with mapi id 15.20.6863.040; Wed, 11 Oct 2023
 17:28:29 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "denis@denix.org" <denis@denix.org>
CC: Jon Mason <Jon.Mason@arm.com>, "meta-arm@lists.yoctoproject.org"
	<meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH 1/2] arm/boot-wrapper-aarch64: remove recipe
Thread-Topic: [meta-arm] [PATCH 1/2] arm/boot-wrapper-aarch64: remove recipe
Thread-Index: AQHZ/F1vpFtFuJigWE2e5sW5dGC71rBE0kKAgAAFqAA=
Date: Wed, 11 Oct 2023 17:28:29 +0000
Message-ID: <515F76C4-6343-422A-AAF9-13B90492C599@arm.com>
References: <20231011130203.3871606-1-jon.mason@arm.com>
 <20231011170803.GF2408@denix.org>
In-Reply-To: <20231011170803.GF2408@denix.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.100.2.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB6118:EE_|DBAEUR03FT029:EE_|PAWPR08MB9566:EE_
X-MS-Office365-Filtering-Correlation-Id: bb413686-2668-4dbd-5991-08dbca7f813d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 6giSAtC/dwha17fNZnAA+QrfjZIJI09Qo0rJMN33AXJ99T9TnZ7lNua8hdIhU/9lnpl/5dkRI2ARAfLJe05WKwF8wrjEVo8tO2oGoP3uIyv8N/fCG6F9qgLklh+dt64CVkp7N2ZUXC5y6WFhjXWxni+ZQY4aI7hIjumBpvfxQf+AHqAosPxW8TtmY91+X34wUhlHl+Gnt4Cdv0ikCv4kpOZ/XuLFkXfTl1bEQYbIPJkJQYCLedYCkwRevCRdQoCXAj8lpF8obicJjNTOKVTopb03YB7CHDgMVsZTos8oXwKNtC/mAXQ13dLcofaksOxguTfFgrZq2s6TocBpQib7XOc5hYFbZYs7XhKZM6dAv64hpEOmr+Nau9O1koU1E8vfkKFsDkz6bFB+CduT6FuKbYQzkJkMd3GO6mK2LjtSiz/HssTGMa+pglCdXatBqtCYRxJAot0Hg8yTMget4+7RetLrcq+ZgpECmUEmr4jOpLY7os6JegJW2pgyvSfeKvMO3W1iznDH1HgK4N8Q6A/RqcQmFllxKI0CEEcASGb9Nvri7903b9+mUj6o+KvFAgzB59i4ocFJP97emIBwhkYxQbv6bayL0IPco4Tb1LEO8uVrxRXMsnicAZeJw4NRgZ+dqLVlfhcwjGMo1mCFUYEd3A==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(366004)(396003)(376002)(39860400002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(41300700001)(6506007)(2616005)(53546011)(6512007)(38070700005)(122000001)(36756003)(86362001)(33656002)(478600001)(38100700002)(316002)(2906002)(4744005)(66556008)(91956017)(71200400001)(8936002)(66946007)(26005)(83380400001)(64756008)(4326008)(5660300002)(66476007)(8676002)(66446008)(76116006)(6486002)(54906003)(6916009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <693C5F4EBB83CB4993A31C9BD27DD42C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6118
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	43a5d624-765b-4eaa-e2f9-08dbca7f7bfd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kxS4K6GGUNCvIu+tGYbLr1oPo5OC6D9YzC/4dkFt1/YM3seBVbsIGYzHEcFRVzPZnV/5MdCAVZHOHot3y2ZJ1Gp9zymCp/NyITNH49gfItyntrAfNBsejjHaZBVYNmKHZYHV/WMtzo5Gg2JV9RsSI4wmYn1kVf5V5MUtZDBqmv1SpQobDhnU/9Ghv5Mopn8Sa4qzkgkJ8RvLFUF5t9ZsvgS8IslLwhiI3nWzIgs5vEkLQlUj0Y0eMXTXHqbxlga8n2k4kGChLGb6YWu6YLrmo6EIUEkf+1AqK/IUiX4xdFPMYqwT4EHVu+9jiL+ydy9duTP0O/WpyKCg53nHbevPM7LV1wJTsacijcymyJHV3Zv0ZsaOLPQkUAE+93LAynB5FgznDMdiTnixIttrEbJmHyBVmAc47x/R0TNmoylKtk5rhFlKdi78yDJuhUCWaLo4VeOPN2OXg0Dvf2eS8L4Mm12DuNQ7s6/WEglbe/wAbKZpYavQ3QQSTK3x2rmUjNXmlLvKHuxZT8pOhy9h5DUPzZBgjcbd9YWBo34X+YcQAaqigdbsrWbWBt6q/S793Opdx+hNqGYfKvzJW9YNZDFKQFBHYkLmZAJ0wB4fo48kK066Z4Bjsl71q9lp9Tr8URLTGLsDQGY+nBG0pkMG+oNmvQmKYe9EIrEES8ngeVowbiRbVXBqqY45wZ2OHCQSlUSgBxPJ1T6ba9flT363AGMbrlKNlHJXsyR6t2H1EhylZEqTR4niHOnb+5FKkEalJJUQ
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(136003)(376002)(396003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(82310400011)(36840700001)(46966006)(40470700004)(6486002)(40480700001)(478600001)(47076005)(40460700003)(54906003)(70586007)(316002)(70206006)(81166007)(4744005)(356005)(82740400003)(2906002)(8676002)(8936002)(36756003)(6862004)(4326008)(5660300002)(41300700001)(33656002)(86362001)(36860700001)(26005)(6512007)(2616005)(83380400001)(336012)(6506007)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 17:28:38.0683
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb413686-2668-4dbd-5991-08dbca7f813d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9566
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 11 Oct 2023 17:28:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5110

T24gMTEgT2N0IDIwMjMsIGF0IDE4OjA4LCBEZW55cyBEbXl0cml5ZW5rbyB2aWEgbGlzdHMueW9j
dG9wcm9qZWN0Lm9yZyA8ZGVuaXM9ZGVuaXgub3JnQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IHdy
b3RlOg0KPiANCj4gT24gV2VkLCBPY3QgMTEsIDIwMjMgYXQgMDg6MDI6MDJBTSAtMDUwMCwgSm9u
IE1hc29uIHdyb3RlOg0KPj4gZnZwLWJhc2VyIHdhcyB0aGUgb25seSB1c2VyIG9mIHRoaXMgcmVj
aXBlLiAgU2luY2UgdGhhdCBoYXMgYmVlbg0KPj4gcmVtb3ZlZCwgcmVtb3ZlIHRoaXMgYXMgd2Vs
bC4NCj4gDQo+IElzICpjb21tb24qIG1ldGEtYXJtIGxheWVyIG5vdyBiZWluZyByZWxlZ2F0ZWQg
dG8gb25seSBzZXJ2ZSBBUk0ncyBvd24gQlNQPw0KPiANCj4gSSBkb24ndCBrbm93IHdoYXQgZnZw
LWJhc2VyIGlzIG9yIHdhcywgYnV0IEkgZG8ga25vdyB0aGF0IGJvb3Qtd3JhcHBlci1hYXJjaDY0
IA0KPiBpcyBjb21tb25seSB1c2VkIGJ5IG90aGVyIEJTUHMgZm9yIGVhcmx5IHN0YWdlcyBvZiBu
ZXcgcGxhdGZvcm0gZGV2ZWxvcG1lbnQgDQo+IGFuZCBib2FyZCBicmluZ3VwLCBhbmQvb3IgY3Vz
dG9tIGJvb3RmbG93cy4NCj4gDQo+IFJlbW92aW5nIHRoaXMgY3J1Y2lhbCBjb21tb24gY29tcG9u
ZW50IHNlbmRzIHRoZSB3cm9uZyBtZXNzYWdl4oCmDQoNCkl04oCZcyBhaW0gaXMgdG8gYmUgYSBj
b21tb24gc291cmNlIG9mIHJlY2lwZXMsIGNlcnRhaW5seS4NCg0KQ2FuIHlvdSBwb2ludCB1cyBh
dCBhIEJTUCBsYXllciB0aGF0IHVzZXMgdGhpcyByZWNpcGU/DQoNClJvc3MNCg0K

