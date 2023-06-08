Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8ECBC7EE29
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 14:33:19 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.49])
 by mx.groups.io with SMTP id smtpd.web11.10677.1686234792027039256
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 08 Jun 2023 07:33:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=MHq7VoPj;
 spf=pass (domain: arm.com, ip: 40.107.22.49, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KY+QRAyaTD1VV3t2Ey7PiU72QZc9f2ryb5WdGJPRC1Q=;
 b=MHq7VoPjjQEVx2njpIswftZos8p4QZyHCZH4OrqGb37FroVXVrUghmV9KGJ5qoZ0CB+WrS1S3uf+r37+4o8nzR32TfbHXIRyj1KdMG0uytPGRmtzhlxHEC3/JRufxL4qaKfxYSyiLbrKTQl2lPaiE1QN6MyRh2/BUgVLtr+1nPk=
Received: from DB6PR0201CA0004.eurprd02.prod.outlook.com (2603:10a6:4:3f::14)
 by DU0PR08MB9440.eurprd08.prod.outlook.com (2603:10a6:10:42c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Thu, 8 Jun
 2023 14:33:06 +0000
Received: from DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3f:cafe::5a) by DB6PR0201CA0004.outlook.office365.com
 (2603:10a6:4:3f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32 via Frontend
 Transport; Thu, 8 Jun 2023 14:33:05 +0000
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
 15.20.6477.25 via Frontend Transport; Thu, 8 Jun 2023 14:33:05 +0000
Received: ("Tessian outbound 3570909035da:v136"); Thu, 08 Jun 2023 14:33:05 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1a46b9dd160d991e
X-CR-MTA-TID: 64aa7808
Received: from 006ecd98d2d5.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5CBC5599-249C-4839-83F4-219002FC65C0.1;
	Thu, 08 Jun 2023 14:32:25 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 006ecd98d2d5.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 08 Jun 2023 14:32:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XLKddVkEa0kq8oZ48QQu8LjQGiPHDwtH154SLz+gi1k+sDCW+E4YB7xSR5/DK9siwkDbqLTXxV1BJ5V+Pwc9l9E0qwkxSYITy6YDjT+50WDlLXVJiFpddKIyhOuuDs4pCBgke3rwWUQDtfluNa27LI8Mx5V1S0gkdJ0eScpgV7GPQDh4/f8szbySBL8AcRn1Ueggnj6/2VYp9ogzLRFVCncPpTux9p60giexHAPcdxbWVyg2ega8VnXPeZXth1YJZhKhojXAWowtJxp2zfTmU8eZmLT+/EnX2rPHYiV24DV0eBJ0LUZkBa8Bt4n41TcCx+3A7KTVPaAE99K3eVYaSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KY+QRAyaTD1VV3t2Ey7PiU72QZc9f2ryb5WdGJPRC1Q=;
 b=N+O6QMyNz6Hj5IZcTNY0KvNyl8vRBMm10E+8FYvN7XLyh3UopTlPCYMqlSgHYs5vlINCfi5KqZ5DtShEB3Rlvr+x7/pLmeK2ceWfVNptf8dUdYb7+EqQpPsXaz49XKmJz4G2MbO//wbkGgr/g9DJiAN5nmL1LaUZXrTq59Mbt9wRWFT21rU95Gq2v4s5wpE09ffGsE4lV+/nYFa7Iaq+OOpsqC+4LLr1LQrhlHl55kKfxbF5uAv+ak9leRs2fBf/7hNF33LeYLS42sJ8CtPMARzH/KfsNOhQmCUbQoExhqVOxnF5th95Y6IeqUYHC/2cAG3vTxcTqRbZ+A4fc6f+uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KY+QRAyaTD1VV3t2Ey7PiU72QZc9f2ryb5WdGJPRC1Q=;
 b=MHq7VoPjjQEVx2njpIswftZos8p4QZyHCZH4OrqGb37FroVXVrUghmV9KGJ5qoZ0CB+WrS1S3uf+r37+4o8nzR32TfbHXIRyj1KdMG0uytPGRmtzhlxHEC3/JRufxL4qaKfxYSyiLbrKTQl2lPaiE1QN6MyRh2/BUgVLtr+1nPk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBAPR08MB5720.eurprd08.prod.outlook.com (2603:10a6:10:1a1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.35; Thu, 8 Jun
 2023 14:32:23 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6455.030; Thu, 8 Jun 2023
 14:32:23 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denis@denix.org>, Sumit Garg <sumit.garg@linaro.org>
Subject: RFC: removal of gcc-arm recipes
Thread-Topic: RFC: removal of gcc-arm recipes
Thread-Index: AQHZmhYJ7Jja8yGnYE6dC9IUBQ6iuw==
Date: Thu, 8 Jun 2023 14:32:23 +0000
Message-ID: <9BB4164D-F0CC-4CB9-BAD0-4F3E64E7904A@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBAPR08MB5720:EE_|DBAEUR03FT010:EE_|DU0PR08MB9440:EE_
X-MS-Office365-Filtering-Correlation-Id: bb148722-1c76-4072-5b32-08db682d45e5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 dzpDS8DLHB2jFaKONmgPnqy6f0XjgROofodZFKqzr6V9/o5pVs29JX+DtwOuVAglie+UD5JdCpKdhM41+ZP50YvlVV/Q4o6Wn3D3LOtDVAbgPZ73zwbEei7P9MIFy4HewB3KbYXcGrlJaslK1RCOcVCNDEg10jok9U2ah0fwwFD92JGswZWuLSoQaDNyCLWy53RRr/U79m1GGSUTgwmEJJuyPh5P63XgqvukZiKZlgV1HuiVDOlHKTeDlgOO6ghrENf3hS7iRRcWFgoDjHe+XjFRzGChjK1kqrY9XT0/xm5oSdtsiieCmhyziKx+cON4qMhGPza3XWZCGPw36IILnR4Ymp0ZhNJFvu9bJrFTjH3EjkZLir7CKKDKWb/jDgH06UmScV8tFr7XiAq+LgQwyJ5UsLKsIczOfBTp8EgCWX8azIbsvRTGciE8zVB7paqMnUv/7ljpw0Atm7+YxKDFFtj5uUefqOc3stmH9g4TkV+mi17x8b0/OUr51jlzAuz3WZo19gbZBbpOXAPb8dvs3M301bOgtvMzwRALs4rSWns55EIzvVPG6OCdw/5rRJmP6pXUnaSBdHZ1YVO+v9ORqI1SVKGzflmBTwciMbE4/e9YQAw8CFDIJo/faIOFJWrwRGTwdyxb338t3yhW0vGg9A==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(346002)(376002)(39850400004)(136003)(451199021)(2906002)(8676002)(5660300002)(8936002)(41300700001)(316002)(6916009)(4326008)(91956017)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(54906003)(71200400001)(6486002)(478600001)(6512007)(6506007)(26005)(38100700002)(86362001)(83380400001)(186003)(36756003)(2616005)(33656002)(38070700005)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9BE86627E06B3845BFA1C3B336E97F4B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5720
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a965e848-c54a-4d4e-c8d4-08db682d2c74
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CP9IGNh0yw+/08J5oOBdg0X4wZD5FYFkA1uFreCzpPxOQHQ5WXR+iq5Z6e5HZISOqiKNRxMu87by0uMh7MRGGFWI39oj3R59k4Miq8PY1UKBQB1HVViFthbU3CRxOfFwnwi2Ko2nKS4OFqHtxc/maCJUKjpCU03qvpprb2y3Tq7+kwr6AuZWW0dA8z18fTQrGEskW7/uaoDD+dm6HK8MmHSgGrQ0GEYFnfK/r9f13VTV51Lza+sMAsdWfy9XKfOVIrNm7vTOQpi0WPkUiypnqZAknRFIMBXROEHjG/xzjbqsSHgm9VlFu1YHX8r0BvH428RrgWh7M0Gx3Xp5A2X3IiqrIc2FQ9Mn1/BroT1e1IB9Pu2i0S4oDayFk9tdO3abcS4jiQfynMCoIe000MuKFvixWMzCkqjLQrcTDKlo8e2qTA6fRnDwEHBEumGUwyRVvOWqyGmIZGGYj/4OjcH6CtypXqz0b+8UlafN4fawvkHw42CNM4t0KhfaxkI0X/3n/WSiAr0+wGcGw4pdZWCH9NUeLWEUizBJpbO8O1P60DOiUEw83x/ShH8+Pfk4464y/MngkReh8N7O4TSjdH0m08qkxrxTVBOiZ8iR5R5uqKX0xWLP7HEkVoa2wqopeVWyVUy+A5J9aH0JnQ3WMmOkl/DBaHcBGDX/KQsJaaKJF5GDFETPlIFeva4B7z+tyRFz/O0lfi+0cmSbkXMKPwYPJuoV2yHaveSBtjXOYWXPAid5C6+YprwOR4BFHqgyrczN
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(396003)(136003)(451199021)(40470700004)(36840700001)(46966006)(5660300002)(81166007)(40460700003)(316002)(356005)(6916009)(4326008)(8676002)(8936002)(86362001)(36756003)(41300700001)(82310400005)(33656002)(2906002)(40480700001)(70586007)(2616005)(6506007)(70206006)(336012)(6512007)(26005)(107886003)(83380400001)(6486002)(186003)(47076005)(36860700001)(82740400003)(54906003)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 14:33:05.8376
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb148722-1c76-4072-5b32-08db682d45e5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9440
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 08 Jun 2023 14:33:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4751

Rmlyc3QsIHRvIGJlIGNsZWFyLCBJIGFtIG5vdCB0YWxraW5nIGFib3V0IHRoZSByZW1vdmFsIG9m
IHRoZSBiaW5hcnkgdG9vbGNoYWluIHJlY2lwZXMgKGdjYy1hcm0tbm9uZS1lYWJpIGFuZCBnY2Mt
YWFyY2g2NC1ub25lLWVsZikgb3Igc3VwcG9ydCBmb3IgZXh0ZXJuYWwgYmluYXJ5IHRvb2xjaGFp
bnMgKFRDTU9ERSA9ICJleHRlcm5hbC1hcm3igJ0pLg0KDQpJ4oCZbSB0YWxraW5nIHNwZWNpZmlj
YWxseSBhYm91dCB0aGUgZ2NjLWFybSByZWNpcGVzIGluIG1ldGEtYXJtLXRvb2xjaGFpbiB0aGF0
IHRha2UgdGhlIHNvdXJjZSByZWxlYXNlIG9mIHRoZSBBcm0gR05VIFRvb2xjaGFpbiwgYXBwbHkg
dGhlIGJlc3QtZWZmb3J0IHJlYmFzZSBvZiB0aGUgb2UtY29yZSBwYXRjaGVzIG9uIHRvcCBvZiB0
aGF0LCBhbmQgdGhlbiBidWlsZCBpdCBhcyBHQ0MuICBUaGlzIHJlY2lwZSBpcyB0aW1lLWNvbnN1
bWluZyB0byBtYWludGFpbiAodGhlIHBhdGNoZXMgbmVlZCB0byBiZSBtYWludGFpbmVkIGFuZCBz
eW5jZWQgd2l0aCBvZS1jb3JlIG1hbnVhbGx5KSwgYW5kIHdoZW4gdGhlIG9lLWNvcmUgR0NDIGFu
ZCB0aGUgQXJtIEdOVSBUb29sY2hhaW4gYXJlIGRpZmZlcmVudCB2ZXJzaW9ucyB0aGluZ3MgdGVu
ZCB0byBicmVhay4NCg0KRm9yIGV4YW1wbGU6IG9lLWNvcmUgbWFzdGVyIG5vdyBoYXMgR0NDIDEz
LjEgc28gb2UtY29yZSB1c2VzIHRoZSBuZXcgLWZjYW5vbi1wcmVmaXgtbWFwIG9wdGlvbiwgYnV0
IGdjYy1hcm0gaXMgMTIuMiB3aGljaCBkb2VzbuKAmXQga25vdyB0aGlzIG9wdGlvbi4gIFNldCBH
Q0NWRVJTSU9OIHRvIGFybS0xMi4yIGFuZCB0aGUgYnVpbGQgZmFpbHMgYmVjYXVzZSBpdCBwYXNz
ZXMgYSBHQ0MgMTMtc3BlY2lmaWMgb3B0aW9uIHRvIEdDQyAxMiwgYW5kIHRoZXJl4oCZcyBubyBu
ZWF0IHdheSB0byByZW1vdmUgdGhhdCBvcHRpb24gYXV0b21hdGljYWxseS4NCg0KVGhpcyBkb2Vz
buKAmXQgYWZmZWN0IHRoZSBleHRlcm5hbCBiaW5hcnkgdG9vbGNoYWluIHN1cHBvcnQgYXMgd2Ug
Y2FuIG1hbmlwdWxhdGUgREVCVUdfUFJFRklYX01BUCBpbiB0aGUgdG9vbGNoYWluIGZpbGUgYXMg
bmVlZGVkLg0KDQpNeSBoeXBvdGhlc2lzIGlzIHRoYXQgbm9ib2R5IGlzIGFjdHVhbGx5IHVzaW5n
IHRoZSBnY2MtYXJtIHJlY2lwZXMuICBJZiB5b3UganVzdCB3YW50IEdDQyB0aGVuIHlvdeKAmWxs
IGJlIGJldHRlciBvZmYgdXNpbmcgdGhlIHJlY2lwZXMgaW4gb2UtY29yZSBhbHJlYWR5LCB0aGV5
4oCZcmUgdXBkYXRlZCBtb3JlIHJlZ3VsYXJseS4gIElmIHlvdSB3YW50IEdDQyB3aXRoIEFybeKA
mXMgc3BlY2lhbCBzYXVjZS9zb3VyY2UgdGhlbiB5b3XigJlyZSB0cnVzdGluZyB0aGF0IG91ciBy
ZWJ1aWxkIG9mIGl0IC0tIHdpdGggYWxtb3N0IDMwIHBhdGNoZXMgb24gdG9wIC0tIGlzIGFjdHVh
bGx5IGVmZmVjdGl2ZWx5IHRoZSBzYW1lIGFzIHRoZSBiaW5hcnkgcmVsZWFzZSB0aGF0IEFybSBt
YWtlcy4gIEluIHRoYXQgY2FzZSB5b3XigJlyZSBwcm9iYWJseSBiZXR0ZXIgb2ZmIHVzaW5nIHRo
ZSBiaW5hcnkgcmVsZWFzZTogeW91IGNhbiBiZSBzdXJlIGl0IGRvZXMgd2hhdCBpdCBjbGFpbXMs
IGFuZCBpZiBpdCBnb2VzIHdyb25nIHRoZXJl4oCZcyBhY3R1YWxseSBhIHN1cHBvcnQgY2hhbm5l
bC4NCg0KU28sIGluIHRoZSBzcGlyaXQgb2Yga2VlcGluZyB0aGUgdGhpbmdzIHRoYXQgcGVvcGxl
IHVzZSBhbmQgcmVtb3ZpbmcgdGhlIHRoaW5ncyB0aGF0IHBlb3BsZSBkb27igJl0LCBJ4oCZbSB0
aGlua2luZyB3ZSBzaG91bGQgcmVtb3ZlIGdjYy1hcm0uICBEb2VzIGFueW9uZSBoYXZlIGFueSBz
dHJvbmcgb3BpbmlvbnMgb24gdGhpcz8NCg0KVGhhbmtzLA0KUm9zcw==

