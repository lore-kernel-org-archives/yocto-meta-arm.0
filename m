Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37006EB64D7
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 14:20:47 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.43])
 by mx.groups.io with SMTP id smtpd.web10.14252.1686666045319455180
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 13 Jun 2023 07:20:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=DQS6lS/8;
 spf=pass (domain: arm.com, ip: 40.107.22.43, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYokquJr14towhqaryNVygd5nxRYzb3eC9e+I+srHsY=;
 b=DQS6lS/8B3fOgdH+8uP1EUa6Mq128RCpPy3gUdP419AOPrjZicopHWmxoOEDqmVf/Ye6RE8xd1g2CNmfrYryuntS1dT+7+L0QWjfhq36f3ooCQbxn2DPSe9PUhAOz50s0SnV7ClwgaYKSYWQDFa23vzgcmVIqohza0piHvUDfyo=
Received: from DB6PR1001CA0025.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:55::11)
 by AM7PR08MB5304.eurprd08.prod.outlook.com (2603:10a6:20b:10e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.39; Tue, 13 Jun
 2023 14:20:42 +0000
Received: from DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:55:cafe::e3) by DB6PR1001CA0025.outlook.office365.com
 (2603:10a6:4:55::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.33 via Frontend
 Transport; Tue, 13 Jun 2023 14:20:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT010.mail.protection.outlook.com (100.127.142.78) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.22 via Frontend Transport; Tue, 13 Jun 2023 14:20:42 +0000
Received: ("Tessian outbound 945aec65ec65:v136"); Tue, 13 Jun 2023 14:20:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9a1e45ffbc41b9a9
X-CR-MTA-TID: 64aa7808
Received: from 09137295885f.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 74857802-BE8B-406F-BF6E-FF67E4110FDC.1;
	Tue, 13 Jun 2023 14:20:29 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 09137295885f.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 13 Jun 2023 14:20:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nH8dzgjoH8M3bsU6M1IrT9K4QUABGsahCRDANqTK3uy+p32eLwiALCLOB5UhRcsVX8bSUlDmLN5o1cUKzh9Qi2lN8I1f5qLFp2Q2BYTe6Aup0MkFuLcIHjSvp3MpfFW2Ljq3tOTBrmIkHhBCpH/AO+J1EAdOscMHjNBVeWAkP1AQsVtgZNZ9lZLEzhJc7NbHmgOEDYla8N6gVWkybY2KqAq7aJJ1EskMyOqsHf3g1CfCY6wWBvyjN5WwnMZpX5ADBgozT2WPH4jEwKJqcdmUynvWzeEHRn0gq0PHDOEey+OgDGoWhm34e3e4vcgkKScINgG2/r+fmnUyaGOcVSaZQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aYokquJr14towhqaryNVygd5nxRYzb3eC9e+I+srHsY=;
 b=O073SedV4cUdcnmNKLYiOqubTrafWVEofrRPLTihE1lKS7KReQlCbfG9jG7B48xR4yyRG4HQ1Q7wCNMwe9qcIfQGcZ7Lw9D+zJ2369cd33VoFVHKBzaqa2ERtatHHL4dPxqq88+HH5d/ieIYJMVrjv5+zdV6qqqUX6Ei4Hb7IyhKmkd8RbjQc1iLq+gjI4Ef348PH7AbZAB53LgRiKKEz0fNAF8gtwnRqLqECDY2cC43ScmIWWZJBLkw+no8iPzWg8GxhsKNI+vBe56rpzJKAyZZCuRsn8DGvRbu62podthK8P43LsAGq3TwdS+0WInuDokqIwL0w/nsIHcLbUHqhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYokquJr14towhqaryNVygd5nxRYzb3eC9e+I+srHsY=;
 b=DQS6lS/8B3fOgdH+8uP1EUa6Mq128RCpPy3gUdP419AOPrjZicopHWmxoOEDqmVf/Ye6RE8xd1g2CNmfrYryuntS1dT+7+L0QWjfhq36f3ooCQbxn2DPSe9PUhAOz50s0SnV7ClwgaYKSYWQDFa23vzgcmVIqohza0piHvUDfyo=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB8275.eurprd08.prod.outlook.com (2603:10a6:20b:56f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Tue, 13 Jun
 2023 14:20:28 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6455.045; Tue, 13 Jun 2023
 14:20:28 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "denis@denix.org" <denis@denix.org>
CC: Gyorgy Szing <Gyorgy.Szing@arm.com>, "meta-arm@lists.yoctoproject.org"
	<meta-arm@lists.yoctoproject.org>, Rui Miguel Silva <rui.silva@linaro.org>
Subject: Re: [meta-arm] [PATCH 01/16] arm/trusted-services: update TS version
Thread-Topic: [meta-arm] [PATCH 01/16] arm/trusted-services: update TS version
Thread-Index: AQHZikR+hmF+V6kO9UOtJvYLrPQvza+H2SkAgAEWqIA=
Date: Tue, 13 Jun 2023 14:20:28 +0000
Message-ID: <219D22AE-6AAE-493F-B4DE-C340B852C8A2@arm.com>
References: <20230519112400.340-1-Gyorgy.Szing@arm.com>
 <20230612214256.GS9226@denix.org>
In-Reply-To: <20230612214256.GS9226@denix.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB8275:EE_|DBAEUR03FT010:EE_|AM7PR08MB5304:EE_
X-MS-Office365-Filtering-Correlation-Id: a93e1cd6-b0db-4ccc-6a5e-08db6c195eb5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 pRi1W1cHAK7BIH81IqwIXeghVxF43vaG5Jw3NvvrFd/J/gY2088QZdrMko8jl6px4X0j8hgybN3EE1R/JC3IcE8fG7RG9OkmS6yRv5pHNVSdFrpDvUMka+44/PQyhe90U7ixjikCfxcPJiGp2ngOq+P6y+dbO9WerUCGuP3YCnwzw/03gbLGJQ6bk9p8vPWMCAYeYEa4UXWKGdPCvN2riYJSdCi+yZ2rKD63IRRiTl7rUAgph+29XF/qa0nedoizsLhmrIaJ3HY3P+eKUtVKMm9ctndHHxHNAJjM3+YwA+8R+rnRrUPfsfi1bCXHjqw+P0U/tr/BqSa3Vys0QG+IcdrL8VcMlB9f9adf6zTNhmvl5Fp+m8Y33Bc6AyGrDHH50SOr9o7F+AlCCJv9q4BqrZs6Evw0AKvBi9vA2rBF/SQohdt8D+R/I+/WY7P98h1wbmxtGzv5ITH3wLiqMZc80GQ1FZ6KoBN0F/5tSoGPO6qcKOKlUJwSVWlUdvF9nO278IS8fLlvi+WzKEPc6ameyzHP4uT/vmfyprxrFemlajp0mffuVPbthkHfIhuNFja4M+Ci/NxHVVFFdrdIz0zlgc93ddvxVfsnxdLXV/bguOPsoGdZVNMW4qNdmnzeQArvuRXs7PWkut633MJulL2cIQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(376002)(346002)(39860400002)(396003)(451199021)(66556008)(66446008)(66946007)(66476007)(71200400001)(76116006)(316002)(64756008)(91956017)(478600001)(54906003)(6916009)(4326008)(36756003)(33656002)(86362001)(38070700005)(53546011)(6512007)(6506007)(26005)(186003)(5660300002)(41300700001)(8676002)(8936002)(2906002)(4744005)(6486002)(2616005)(38100700002)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <40A8747A4D9BA94E9A5709FCD0777F1D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8275
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	345e289e-dfe6-445b-e0dc-08db6c195652
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	J9QDw8whLx7pF5JWLYarrlDhzPgjMcEKhpvbnzrtMNAc/T5E2wDXU08l0sQ2QdU+csPpK28H/l5eoA5mqZLCxt4aBXwu3VEOaaeTuC4lWkEjIxmkP486TG03R0UVFqLDroYml2EICBNi4572VoPxQMr5POgh1fEeXK6zaLY+m8IoTJ1tFiEK3XJDvZLUEGZl7LL/Zy+5Bja4j9z3CKhzX+THgxw5lDHxUktZG5gVK7XHxiLbSFDQsbfrGNzo4zGJ/mp16wi2vG24eg8p8DlIZo0IWm2ZkU3F2CMVgdP6S51u9PEHIJc5/nSWUperdv3+qkvqerPx8FXAYnByTSQNAc9sjP1xqNItuN07zt06FZ4uRf7g5rPzBpZfQhCIscDYO8zsehrFbPCAAP0M/Ej7eV3isX65Qo0dl2GrjuoYsIbjLnHNezHKihF6zNWX9E0vbR3lm4mFwvg6MgWDXSfMzLPzkV0tqoA3w3ztIZUslc830lJjimhX3bulG0En9y8sUtjbUv52uMqT7f4YGHwZU+BUBzLgyuC4VPLL86DO10lru6w1s8aNm9lNGBPcTUi+7uyEMcUsVM60m9dovVahP8aknA7b/aAFrmo4JsBTyKLRnDG5cBvTwFzqMHwovEJKp6p5RH3vLVZNKKDIFc4vi0x9OWyH4moXH2/1e/p4MugaIZ5WSFpjRVBD/H2tS+2FvOH515bf06fDmfiRFV1/mhOYT94fw917ieDm/VtKEkKLQucxgfWlgBZ66Vfdfaz8
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(136003)(346002)(39860400002)(451199021)(36840700001)(40470700004)(46966006)(316002)(70586007)(70206006)(4326008)(186003)(8936002)(6862004)(8676002)(54906003)(5660300002)(478600001)(4744005)(2906002)(41300700001)(40460700003)(107886003)(6486002)(53546011)(81166007)(33656002)(40480700001)(356005)(82740400003)(336012)(26005)(6512007)(6506007)(36756003)(47076005)(86362001)(82310400005)(36860700001)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 14:20:42.1830
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a93e1cd6-b0db-4ccc-6a5e-08db6c195eb5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5304
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 13 Jun 2023 14:20:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4770

T24gMTIgSnVuIDIwMjMsIGF0IDIyOjQyLCBEZW55cyBEbXl0cml5ZW5rbyB2aWEgbGlzdHMueW9j
dG9wcm9qZWN0Lm9yZyA8ZGVuaXM9ZGVuaXgub3JnQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IHdy
b3RlOg0KPiANCj4gSSB3b3VsZCBsaWtlIHRvIHByb3Bvc2UgcmV2ZXJ0aW5nIHRoaXMgc2VyaWVz
IEFTQVAgZHVlIHRvIHRoZSBicmVha2FnZSBjYXVzZWQgDQo+IHRvIGRvd25zdHJlYW0gbGF5ZXJz
IGFuZCBwbGF0Zm9ybXMuDQoNCklzIHRoaXMganVzdCByZWxhdGVkIHRvIHRoZSBFWFRSQV9PRU1B
S0UgKz0gIiBDRkdfTUFQX0VYVF9EVF9TRUNVUkU9eeKAnSBsaW5lLCBvciBzb21ldGhpbmcgZWxz
ZSB0b28/ICBPYnZpb3VzbHkgdGhhdCBuZWVkcyBmaXhpbmcsIGJ1dCBJIGRvbuKAmXQgdGhpbmsg
dGhhdCBkZXNlcnZlcyBhIGJ1bGsgcmV2ZXJ0Lg0KDQpSb3Nz

