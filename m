Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F00CC7618E
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 14:06:52 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.46])
 by mx.groups.io with SMTP id smtpd.web11.12734.1682086003284092131
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Apr 2023 07:06:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=AEC8uIKG;
 spf=pass (domain: arm.com, ip: 40.107.21.46, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QgbprEhAcquWXpOveWXPKCCCK+QETE24AhZAqcj9vqw=;
 b=AEC8uIKGX47qBWlLL/fAcAfa76zHviNVaAEHCvcCrsd2rM1sV3arWL6W9XnpjhTKDUwbX7ObtfQFOJDhsBZ+wMrkOQ8d1FSfWs6PAn4SBVeGaCzysBbDtxC6MourWBBsIYB59FkoS7IFlm0mjojutIozBlndHo2X72fJCphFXaA=
Received: from AS9PR01CA0033.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:542::19) by DU0PR08MB9393.eurprd08.prod.outlook.com
 (2603:10a6:10:420::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 14:06:30 +0000
Received: from AM7EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:542:cafe::30) by AS9PR01CA0033.outlook.office365.com
 (2603:10a6:20b:542::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.27 via Frontend
 Transport; Fri, 21 Apr 2023 14:06:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT034.mail.protection.outlook.com (100.127.140.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.14 via Frontend Transport; Fri, 21 Apr 2023 14:06:29 +0000
Received: ("Tessian outbound 945aec65ec65:v136"); Fri, 21 Apr 2023 14:06:29 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c0c6ed165d3cfa8e
X-CR-MTA-TID: 64aa7808
Received: from bfe59ffa6ca8.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 310A73DD-0F13-4013-B644-607D03EFEFD9.1;
	Fri, 21 Apr 2023 14:06:22 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bfe59ffa6ca8.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 21 Apr 2023 14:06:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cL5mhYUp3FnRUITwGxN2GMDlWalBQ7u3JDoLSc+Cm5rQvMuqqLAbxplMmksSeMmXHLdHxc/I4d7quCvannYCuunNfAAOb1MFgaGmjUv7UhMQ/PJKuBqCDJNhK1+fzVK7VjeZQsVXniGG/MQxFtz0vkIv9FL3dFml3Dcfr5ABqCqdT+kCAPnoI3un/Y9/jHyvtXiEhtl8/ca0Q/404rXwlP+56dnDge/ywZ8U4oGFbQV5QdUlItBKxVcG9kCp81NXsVW7dH/R7wbjzVzWG2+lxxWBUT6b2bu5//HYiKEVuTXOtLinmHBHdCgA1XSqOKX7tLKgBTo2rrUnUxFSG8SS+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QgbprEhAcquWXpOveWXPKCCCK+QETE24AhZAqcj9vqw=;
 b=dPJoxhMdeDuKYJW9e3yrl3A2wWMelPrm3+gjG/4DlPmZhPzuZUXQlLNrysb7l1tRO+j+kxDmScoubokAUP3b/Wb4+WYatVqITRUmkUKMR5WT+iptRUmeHljyMnSZ8zVfdwdfp/MGpOKhhqKbTorm5W3ODQ7+lcR+pdFWGmLBZ0Wge8X0+dShYiF7lOFJvAN0U5HraQVz6H0GlGAz16oCTiwlUs/HTpUAudJYfVz0kE3+xkfN7C8psIUilWR4wdKZPIGMVO3aufTblBBM1X4i47SyTrlYQaRbJrWw1NljcqY5ooDLVDvPOqyxe3m1ItvvriQEYr5vvR47GxVsfJowOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QgbprEhAcquWXpOveWXPKCCCK+QETE24AhZAqcj9vqw=;
 b=AEC8uIKGX47qBWlLL/fAcAfa76zHviNVaAEHCvcCrsd2rM1sV3arWL6W9XnpjhTKDUwbX7ObtfQFOJDhsBZ+wMrkOQ8d1FSfWs6PAn4SBVeGaCzysBbDtxC6MourWBBsIYB59FkoS7IFlm0mjojutIozBlndHo2X72fJCphFXaA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB7370.eurprd08.prod.outlook.com (2603:10a6:20b:446::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 14:06:21 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%5]) with mapi id 15.20.6319.022; Fri, 21 Apr 2023
 14:06:20 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "peron.clem@gmail.com" <peron.clem@gmail.com>, Denys Dmytriyenko
	<denis@denix.org>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH v2 1/2] support: add libmxml 3.3.1 recipe
Thread-Topic: [meta-arm] [PATCH v2 1/2] support: add libmxml 3.3.1 recipe
Thread-Index: AQHZdDDYNQIQ2MAKz0CzdLwibx2wwa81zHaA
Date: Fri, 21 Apr 2023 14:06:20 +0000
Message-ID: <C6BB3F5B-314F-4D2B-BD98-3C68C2F59AD3@arm.com>
References: <20230421090732.54079-1-peron.clem@gmail.com>
In-Reply-To: <20230421090732.54079-1-peron.clem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB7370:EE_|AM7EUR03FT034:EE_|DU0PR08MB9393:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ce2e149-311c-4124-70ae-08db42719aa6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 1aEW18fWbqe9CmMwu83yMiDKr/h7BjKdmFBqY2tHSGej/1uUZHHa0WKFdyH9Jk69Cu3xHpWKOQodwRlzS1uC/9a0qyxOTQ2BNgD3A++LbNkrLGbLGbts7Xaro23qiC5/CCN3kbCEyR93LgYy8ZZWHbK/6onGlZyeFMpS8/R32j08x72dj4UsLFmRAOqBlBLRtg4IRjFnws6Y9vXEcltN7P3WY0oRgUQ7rvF5V2SNSlJsu2UXRNgl71F/WklmHx5kYK2ISM4OA4F9iEsWo7nz67o86GKfmLkTAH+3Yk+PSPNZhMKsAaIfhcXXZfgVGqNU5thRlwYZx7DbjtExBiCZiH19sFDdwZkriDjwfte2ctaPhrrrYhF7o7t5CORedCcCxhFIP9QpL+4ZFFRedIUUnxDZ/U4j/tjfWM3Yzjb2/AGOF6ffZaHDGZUZGD8sG/7TaQt3V0pI4KMXZmCfFSwgDfXp2r3d7CohbzNppJkANInRMGfutE/Irq9sHHoNcqIUd7PVO7Q0QDcoOYOinJD2qLxF4Q+YlFx2ohIJVgkTQHFml7x+tuIbK6WrDNHNPxqxuEgmyNZ61kEzfvFDmcg9cyrF4WG8IojJnzf/LgRdXQMDoX8/HcWGtLqwwgPxKcXnFkcEEQk7NQEebGJmvcC2ww==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(366004)(39860400002)(136003)(451199021)(4326008)(91956017)(64756008)(76116006)(66446008)(316002)(110136005)(66476007)(66946007)(66556008)(478600001)(71200400001)(6486002)(41300700001)(8936002)(5660300002)(8676002)(38070700005)(2906002)(4744005)(86362001)(36756003)(33656002)(38100700002)(2616005)(186003)(53546011)(6512007)(6506007)(26005)(66574015)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B8057035D2D87949A38FDD92208A0953@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7370
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c6015c79-5383-4eaf-022f-08db42719505
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BGpuMT5MxF/fRO5Q5bGCIRVur03gcROVisLCHF0+xfRnK3B+EORDtKwjG+Ms4PGzNAFYbKsz+zgqE0HnZKhVMgdWzZaw6/B8TV8/78nDOHAEuDm3PDF1vJOuVQZ48hitMGDSFv5sY5j/LMUcOhy5dlT9c//VIf2RP6707hDmMNiBNi8LcljSmeyAhAoYKeTRYtMALGedv7LO8wWFA6s92uJMFHLxzgowTMR5VWwqqI/NB/n9O/8EP2FyxqlS0V8nlIqvjHhP5gaoP48YO05kIKdqOAuYLeUzi/jtRQ3ToCMNypFuzuALBXvNzxE9UGfDp1jVnbgJxzoZSbiIu1mqdSUcaUQjtIOCtutvzu70sr/HF/vaXpk+n74S66sh3jFmNV36H/53Px6cltXxeiiW0fiu1BGLc7D/43x2JFmg5ShjB5uJelP1+QWOXWUCqu7QG2OHmo5yyF9PM+N8gznjKEhK3tvOajMSIBvkLP1GpDwF1aQsz8yUUN11rs5Ve+yqN5HJMZomwjA87Y9DZXgXPZKASffrQ01fBIzpe39MA8nKTa5tTShucy9bl1RFflFUJK1+QeM/6phv583eIZFs+27G5gXNyA7jXjiDSdT6ZMmgPb4ijf1K+f0zhQJ7dulvOAwz37Cfdolg61BR+2j3XSIgIs4QNDxOv1/WWOU105uhPIqV7XCsbYyCv7FpODMo2B1o46t6kskkjFrPY0O7qg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(39860400002)(396003)(451199021)(40470700004)(46966006)(36840700001)(40460700003)(316002)(70586007)(70206006)(4326008)(40480700001)(110136005)(6486002)(86362001)(82310400005)(478600001)(5660300002)(36756003)(2616005)(8676002)(8936002)(81166007)(356005)(66574015)(82740400003)(2906002)(4744005)(47076005)(336012)(36860700001)(33656002)(41300700001)(186003)(26005)(6506007)(6512007)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 14:06:29.5612
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ce2e149-311c-4124-70ae-08db42719aa6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9393
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 21 Apr 2023 14:06:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4608

T24gMjEgQXByIDIwMjMsIGF0IDEwOjA3LCBDbMOpbWVudCBQw6lyb24gdmlhIGxpc3RzLnlvY3Rv
cHJvamVjdC5vcmcgPHBlcm9uLmNsZW09Z21haWwuY29tQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+
IHdyb3RlOg0KPiANCj4gbGlibXhtbCBpcyByZXF1aXJlZCBieSBuZXcgdmVyc2lvbiBvZiBnYXRv
ci1kYWVtb24gYXMgaXQNCj4gaGFzIGJlZW4gcmVtb3ZlZCBmcm9tIHRoZSBwYWNrYWdlIGFuZCBp
cyBub3cgYW4gZXhwbGljaXQNCj4gZGVwZW5kZW5jeS4NCj4gDQo+IFRoaXMgaXMgYSBkdXBsaWNh
dGUgb2YgdGhlIHJlY2lwZSBwcmVzZW50IGluIG1ldGEtb2UgbGF5ZXIuDQoNCkkgZ2V0IERlbnlz
4oCZcyBvYmplY3Rpb24gdG8gKnJlcXVpcmluZyogbWV0YS1vZSBpbiBtZXRhLWFybSwgYnV0IEkg
ZG9u4oCZdCB3YW50IHRvIHN0YXJ0IGNvcHlpbmcgcmVjaXBlcyBmcm9tIG1ldGEtb2UgZXZlcnkg
dGltZSB3ZSBuZWVkIHNvbWV0aGluZyBmcm9tIHRoZXJlLg0KDQpJIGZlZWwgYSBiZXR0ZXIgc29s
dXRpb24gaGVyZSB3b3VsZCBiZSB0byB1c2UgZHluYW1pYy1sYXllcnMgaW4gbWV0YS1hcm0uICBE
ZW55cywgd291bGQgeW91IGJlIG9rYXkgd2l0aCB0aGF0Pw0KDQpSb3Nz

