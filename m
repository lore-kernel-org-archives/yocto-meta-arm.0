Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9CE2C433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 18:44:02 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.80])
 by mx.groups.io with SMTP id smtpd.web08.11094.1665513833399747949
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 11 Oct 2022 11:43:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=fjNy78bu;
 spf=pass (domain: arm.com, ip: 40.107.8.80, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=n/pkT+qx3C9IsdrHnM4sjj/TLjZJUaOVh45WD+ItYsgV0NQQF1QN0bQYXmcRrCyPJFDFGqHgy4+nctzzLI5zxtNruqiaOq9sT58phIWJdiEeUIN3F808W0Dcui/X+MESHMfPkAyTDRa3bI8MTRQWYMvzUyNFNPDUJRUcWd+T4jHKosW1KJPHEbsr2+rq+cE50lMg8zqcA/7Bhl/fZl0S4kBRQ/wqss5cOT1czKhEjegbFRl7jgSTX799P2jTehGPH6IbcYw1tTlnHSMpEMgDTH3pNBu+mvSFmLJXldgRzYxXL9iH5mlbiswxHdDsv5TWdgQKkLqsuPwAken8HwI/Iw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HIJFMkTVZgRNAtQjvU7Eg4ktoRbvjRpQVPYPJuBvLkg=;
 b=Sp68o2wiNyuZ4XzF6w4XfYxud7cT2Vcpko+TTvLN+5ptVHTWbjUJBWssTztU2VrF2aZ2CSNEBMvtoTuaSIh8q84ZpWiPhF8KRonr4t3EN+aw6cpCNgsa8dxC2mAhVfPb0pbI+fyGok4dkHBii73BAc38pkOt780FdiUnVzLifzk2iXcPvhaZjf/c6EgmPEDoSu/If1dSgpXcFG5XhiHf3zBhdq/ZoEo1fMTyScko61+Ijjq+WbF0qhJzt3iz//ax0EjwcBOIO0aIYZZEVZeVToBeVUi+2SbcuEV/N5MYKODisbsNRvGGJG9eGnxCs6s21uYowxNJn8dj6d0StwdztA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HIJFMkTVZgRNAtQjvU7Eg4ktoRbvjRpQVPYPJuBvLkg=;
 b=fjNy78buCKwTutok/poJqOhMp787OTn+ieHr7Uq9aFPAgrbapQm94M1rQ3Hebhopn7gYi+JiJfpwumqeb7//8YvKVBXS5k7edt93iBlE1PG/0UW2BLW/PoIA5iyapov9X9wrcVWQOWMVJIHRlANLcI7oMHFw+Rn1AHR+I/+YLrs=
Received: from DB6PR07CA0161.eurprd07.prod.outlook.com (2603:10a6:6:43::15) by
 AM8PR08MB6577.eurprd08.prod.outlook.com (2603:10a6:20b:355::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.19; Tue, 11 Oct
 2022 18:43:48 +0000
Received: from DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:43:cafe::6b) by DB6PR07CA0161.outlook.office365.com
 (2603:10a6:6:43::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.13 via Frontend
 Transport; Tue, 11 Oct 2022 18:43:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT019.mail.protection.outlook.com (100.127.142.129) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Tue, 11 Oct 2022 18:43:47 +0000
Received: ("Tessian outbound ce981123c49d:v128");
 Tue, 11 Oct 2022 18:43:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 96e586b94a7013ef
X-CR-MTA-TID: 64aa7808
Received: from e021824a3410.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A426204B-54FE-45B9-843D-F95C311B9A8B.1;
	Tue, 11 Oct 2022 18:43:40 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 e021824a3410.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 11 Oct 2022 18:43:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YoBDPVx/RUb8cm3RrNMtUMQwxu4EjQo/pdb9omRD+qvaa9nCz1Tu0pLizMUSC4fypzFQzI0wW9I19R+SQSNa/RdwAuOlIM90iBZvHvEpN4rT+80x/a4OKacKo1gyzBZmOYQiFxyoaZan6dMYHz6R678UcWuTrB/I13emalq1r7GYJlfutxNXIdBUnOLYB+4eU7cQ2CPvchkiPHOLV9YnjlcaMlLtnnefCGn2+FzHkiaMtsPeOfKhPQkVRrfEZI+ZjebN2Kx1PMqukfhbS6Aj+DFDPn0NBo57HWXbv7pusy/7icmJKrROmUiXKps8StE8NVA8SxHt+c8uKeKCOVgUdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HIJFMkTVZgRNAtQjvU7Eg4ktoRbvjRpQVPYPJuBvLkg=;
 b=UH/9mL3qDiGNfRRyyoKpQbJw1QNy8XuXYFexz3+S55I8FEmD6ddP8fGvN0itll4U3Aoyb/GPd79JBpeCFhIvaiLxRBO0RA+Qsg1/KPfis0R3OFPbqWPiqoYDfDYZ204OqfFbeGgm+04DOyuhJn9K8728ofYjxZBGwAw2QxmP9crY8/P27n3Te2+QsnANxgQugMqSye07l8lSfCBahA9jWha7+9gLm97ReTJS/o5AkOaA62nGvmIJUePIqR9NzcZoOW1ZmS84A7Tp3CKSpuUJ+yv+W4i24suvcI6DkJOnb/3tHskgPkvIlxAN12iCX98aJBXMQsUjKqdn8vQEog4DIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HIJFMkTVZgRNAtQjvU7Eg4ktoRbvjRpQVPYPJuBvLkg=;
 b=fjNy78buCKwTutok/poJqOhMp787OTn+ieHr7Uq9aFPAgrbapQm94M1rQ3Hebhopn7gYi+JiJfpwumqeb7//8YvKVBXS5k7edt93iBlE1PG/0UW2BLW/PoIA5iyapov9X9wrcVWQOWMVJIHRlANLcI7oMHFw+Rn1AHR+I/+YLrs=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB8613.eurprd08.prod.outlook.com (2603:10a6:10:403::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Tue, 11 Oct
 2022 18:43:32 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%5]) with mapi id 15.20.5676.028; Tue, 11 Oct 2022
 18:43:32 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Jerome Forissier <jerome.forissier@linaro.org>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH] CI: restrict compression threading
Thread-Topic: [meta-arm] [PATCH] CI: restrict compression threading
Thread-Index: AQHY3XUiNiXvKRg0FEKNH/Hq8G+LI64JWGwAgAAvYYA=
Date: Tue, 11 Oct 2022 18:43:32 +0000
Message-ID: <5564CA27-DB1E-4AC9-AAE4-1C5B88C876F7@arm.com>
References: <20221011130710.1638676-1-ross.burton@arm.com>
 <e38df151-ce95-aee9-e929-c10f6403bd15@linaro.org>
 <171D0EC023811592.3472@lists.yoctoproject.org>
In-Reply-To: <171D0EC023811592.3472@lists.yoctoproject.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB8613:EE_|DBAEUR03FT019:EE_|AM8PR08MB6577:EE_
X-MS-Office365-Filtering-Correlation-Id: 0210efdf-1d97-4883-6ee3-08daabb8887b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 rLo7eeHBL09SlWs8ezy/gtQodjCtqKU/6JZsCiYRYiPklXvaH1ZvuIaPtPgNTn4x0ufXi56r8evag1ew7uNaqutQoLgUohBq+Ov/bfvhiEydFq9C34TPKe5c+uwYL3CyMBS1H8ubOi5TyXT/ELfpGGSZ+groLecG+Jz3I9ZSiEU0I1dZXLXsgioiIhC305FCzRgOxMeVDgYFjqW9yMx/KS24VQ7wU5+nuNgIO/JH4k9W7M8XgTULi2vuZOBsKvMCpcXsvBO6XLevAvlSEuOtlkvqWmwHcYvxhXIVsSrVHXsGdTmp0I6CebXKf7NiRBOL0nX+22wqmrFa5IOl+JtXZ9VMkClLiZRFtDtPnmFLeVy0uNPFLfJVUXq2kBTRk8auUVn2aJZqdLQTpjKozr25MR/fc+Zv9OYXUgKV/0ZLsorrf08rdxBq+oWo5lzEmz8NQW2S0pQrYYtAbGC+lJw5hQDPZipyOkY7KIPLdEwhWpPwuPYFf0gBX9MOqmuGdj6O1GkrKbRdSnaBklCb3ekVn3a7MV2vV/z7PNSQweWNb0L+XuYVKRcmFQ7NYYpRqEDoWZS65GgnmU1dWoPdCZvobRUr/3k5Qx8E0JbjmTqDuS5rETmtWvKW9RTf9VljFZqQUoQ/D2mcWH+qJt3PGwq3qUBaOcBGAy0rgGlskq46nRsMOhlTHGdkK8gP+7GRCE/1qLQmtqbndjD7GcuXQcYrR5mtxax1Y0CsyCIXzxKiugj5ReoHWO7EP1y6ISA7Vg9LNbL6b5maJ+vS+Z8+rqyGcv6Vd6OZZdV93b8nGItjl8s=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(39860400002)(136003)(366004)(346002)(451199015)(2906002)(5660300002)(26005)(86362001)(41300700001)(33656002)(6506007)(53546011)(38100700002)(66946007)(66476007)(66556008)(83380400001)(186003)(6486002)(38070700005)(2616005)(316002)(91956017)(6916009)(64756008)(8936002)(4326008)(71200400001)(36756003)(76116006)(478600001)(8676002)(6512007)(122000001)(66446008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <869216FB63D8404DBA05CCDD6FA74DCD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8613
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	19079244-2155-464d-5ce3-08daabb87f66
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JsXQDSsjH1bZsfbWuRXY0cxGHDeprLcSKjwWnG9rSxWT/TldRioPykvIUovUJX1pm2o8Aq5jnkAOHFEOzii6dbvk9gHcEI3yk1g/kO3LtHnxf/dJKmvIcXVJ0KFa4j6M65enNjfkGd05rpm70wFQVkRKUa67tx8W69uW2G8OLv263I1vDv05l9Y8yQOoGDu45eedHfSbyTDtSi2zwN1uQw3gTWrGBU1kq0BtK8KzSnl6FF86YgUPXeaqulV8RyWU7l8Z1YJMt6R1qklMl0lQTjIaPotKFMIcppNVana/jYKLM2omypfRggl5KUSlGvsiPREptatg1J8sfrCDoc/2qT6+ED1a1+6ASiH2VgnbOtByi64GiUaxesMwR6T1nj8gTffp8I3sq8IG72Sgk8UnwxUIlw1CNkTUZgz/0cM30dFR5MjkzQ9+8g65u9ecenv75suzPDKHjnO+/1j6ANMnberMBJ20IcSVu9kFlV4UiGZjKiK0T50L2wltvKrqD/9DNR2sM0uZnHtIJY3qyRydfb7QAeF4XMdZz9m9N8Z+Q8BGK2JEp1Kr+4ODiGI1D8EcxJTZ8kXHpNenmtVWKtxW34EduRNEowO/F1TF8bwVrGAxUoKz8ZJMIW3koVw+3sGuOubjV+XnK9TAoApShe1qiKkfHgllmcB4CPi9xFromRzj5OZBxHpvr1qBt/oKFEBdPFXKOEfKbo9QW9EFGOOYUol5FXiuGE558D/qctG2r+EyTLUIpWQuZF/s0F4s24STrZguIBwhjS6PjuZTqjhlYQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(376002)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(5660300002)(8936002)(6862004)(70586007)(70206006)(4326008)(316002)(53546011)(81166007)(6506007)(6486002)(356005)(33656002)(82740400003)(336012)(26005)(6512007)(2616005)(186003)(478600001)(86362001)(36860700001)(8676002)(2906002)(41300700001)(83380400001)(40480700001)(40460700003)(36756003)(47076005)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2022 18:43:47.8469
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0210efdf-1d97-4883-6ee3-08daabb8887b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6577
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 11 Oct 2022 18:44:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3955

T24gMTEgT2N0IDIwMjIsIGF0IDE2OjUzLCBSb3NzIEJ1cnRvbiB2aWEgbGlzdHMueW9jdG9wcm9q
ZWN0Lm9yZyA8cm9zcy5idXJ0b249YXJtLmNvbUBsaXN0cy55b2N0b3Byb2plY3Qub3JnPiB3cm90
ZToNCj4gDQo+IE9uIDExIE9jdCAyMDIyLCBhdCAxNDoyNiwgSmVyb21lIEZvcmlzc2llciA8amVy
b21lLmZvcmlzc2llckBsaW5hcm8ub3JnPiB3cm90ZToNCj4+IFRoYXQgaXMgYXJndWFibHkgd3Jv
bmcgYWxyZWFkeSwgYmVjYXVzZSBpdCByZXN0cmljdHMgcGVyZm9ybWFuY2Ugb24gPjE2IGNvcmUN
Cj4+IHN5c3RlbXMuIEkgZm9yIGV4YW1wbGUgcm91dGluZWx5IGJ1aWxkIG9uIGEgMzItY29yZSBB
YXJjaDY0IGFuZCAzNi1jb3JlDQo+PiB4ODZfNjQgbWFjaGluZXMuIFlvY3RvIGJ1aWxkcyBhcmUg
cGFpbmZ1bCBlbm91Z2ggdGhhdCBJIGRvbid0IHdhbnQgdG8gc3BlbmQNCj4+IG1vcmUgdGltZSB0
aGFuIG5lY2Vzc2FyeSBkdWUgdG8gd3Jvbmcgc2V0dGluZ3MgOy0pDQo+IA0KPiBIeXBvdGhldGlj
YWxseSwgc3VyZS4gIERvIHlvdSBoYXZlIG51bWJlcnMgdG8gcHJvdmUgdGhhdCBzZXR0aW5nIGFs
bCBvZiB0aG9zZSB0byAxNiBpcyBub3RpY2FibHkgc2xvd2VyIHRoYW4gc2V0dGluZyB0aGVtIHRv
IDMyPw0KDQpJIGp1c3QgZGlkIGEgY291cGxlIG9mIGJ1aWxkcyBvbiBhIHdvcmtzdGF0aW9uIHdl
4oCZcmUgdHJpYWxpbmcuICAzMi1jb3JlIFRocmVhZHJpcHBlciwgNjRHQiBSQU0sIE5WTWUgc3Rv
cmFnZS4gVGhlIHRlc3QgY2FzZSB3YXMgdGlwIG9mIHBva3kga2lya3N0b25lLCBjb3JlLWltYWdl
LXNhdG8gZnJvbSBhIHBvcHVsYXRlZCBETF9ESVIgYnV0IG5vIHNzdGF0ZS4gIFdpdGggYWxsIHRo
cmVhZGluZyBzZXQgdG8gMzIgaXQgZG9lcyBhIGJ1aWxkIGluIDMwIG1pbnV0ZXMsIGFuZCB3aXRo
IGFsbCB0aHJlYWRpbmcgc2V0IHRvIDE2IGl0IGRpZCBhIGJ1aWxkIGluIDMyIG1pbnV0ZXMuDQoN
ClNvIGluIHRoaXMgdGVzdCwgdGhlcmUgd2FzIGEgbWFyZ2luYWwgZ2Fpbi4gIExvb2tpbmcgYXQg
dGhlIGJ1aWxkc3RhdHMsIGl0IGxvb2tzIGxpa2UgdGhlIGJ1bGsgb2YgdGhhdCBjYW1lIGZyb20g
cnVzdC1sbHZtLW5hdGl2ZS4NCg0KSG93ZXZlciwgdGhlIGZsaXAgc2lkZSBvZiDigJxqdXN0IHVz
ZSB0aGUgbnVtYmVyIG9mIGNvcmVz4oCdIGlzIHRoYXQgY2FuIHNvbWV0aW1lcyBiZSBhIHRlcnJp
YmxlIHRoaW5nIHRvIGRvLiAgSeKAmXZlIGFscmVhZHkgYWRkZWQgYSBjaGFuZ2UgdG8gb2UtY29y
ZSB0byBjYXAgdGhlIG51bWJlciBvZiBwcm9jZXNzb3JzIHJldHVybmVkIHRvIDY0LCBhIG51bWJl
ciBjaG9zZW4gYXMgaGlnaCBlbm91Z2ggdGhhdCBpdCBzdGlsbCBzZWVtcyBsaWtlIOKAnGEgbG90
4oCdIGJ1dCBub3QgdGhlIHJlYWwgbnVtYmVyIHRoYXQgc29tZSBzeXN0ZW1zIGNhbiBnaXZlLiAg
Q29uY3JldGUgZXhhbXBsZTogYSBUaHVuZGVyWCAyIGhhcyA2NCBwaHlzaWNhbCBjb3JlcyB3aXRo
IDQtd2F5IGhhcmR3YXJlIHRocmVhZGluZywgc28gbHNjcHUgc2F5cyAyNTYgY29yZXMuICBJIGNv
dWxkIHJ1biBhIGJlbmNobWFyayB0byBzZWUgaG93IHRoYXQgYmVoYXZlcyBjb21wYXJlZCB0byAz
MiBvbiB0aGUgc2FtZSBoYXJkd2FyZSwgYnV0IEkgc3VzcGVjdCBpdOKAmXMgYWN0dWFsbHkgc2xv
d2VyLg0KDQpTbyB5ZWFoLCBpdOKAmXMgYSBiYWxhbmNlLiAgQnV0IGF0IHRoZSBlbmQgb2YgdGhl
IGRheSwgdGhpcyBpcyBvdXIgQ0kgc2V0dXAuIFdlIHNob3VsZCBsZXQgdGhlIHRvcC1sZXZlbCDi
gJx0aHJlYWQgY291bnTigJ0gYmUgdHVuYWJsZSBwZXItcnVubmVyIHZpYSBhIHZhcmlhYmxlIGJl
Y2F1c2Ugc29tZSBwZW9wbGUgKGxvb2tzIGF0IEpvbikgbGlrZSB1c2luZyBpbmFwcHJvcHJpYXRl
IGhhcmR3YXJlIGZvciB0aGVpciBwZXJzb25hbCBsYWIsIGJ1dCByZWR1Y2luZyB0aGUgbnVtYmVy
IG9mIHRocmVhZHMgYW5kIG1lbW9yeSB1c2FnZSBvZiBYWiBzaG91bGQgaGVscCBldmVuIG91dCB0
aGUgbG9hZCB3aGVuIGNvbXByZXNzaW5nIGxhcmdlIGZpbGVzLg0KDQpPaCwgYW5kOg0KPiAyNTYg
Y29yZXMhPyBJJ20gamVhbG91cyA6KSBBbmQgZG9uJ3QgdGVsbCBob3cgbXVjaCBSQU0geW91IGhh
dmUhIDpEDQoNCjI1NkdCLiA6KQ0KDQpSaWdodCBub3csIDIwMEdCIG9mIHRoYXQgaXMgZGlzayBj
YWNoZS4NCg0KJCBjYXQgL3Byb2MvbWVtaW5mbw0KTWVtVG90YWw6ICAgICAgIDI2MzQ4MDMxMiBr
Qg0KTWVtRnJlZTogICAgICAgIDExMjAzNzkyIGtCDQpNZW1BdmFpbGFibGU6ICAgMjUzMDIyMDg4
IGtCDQpCdWZmZXJzOiAgICAgICAgMjU0OTgwMjQga0INCkNhY2hlZDogICAgICAgICAyMDAwMDQw
OTIga0INCg0KUm9zcw==

