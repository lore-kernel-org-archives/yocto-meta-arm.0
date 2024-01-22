Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2223CC4725D
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 11:26:10 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.78])
 by mx.groups.io with SMTP id smtpd.web11.71395.1705922764157987256
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 Jan 2024 03:26:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=c2PxEoc1;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=c2PxEoc1;
 spf=pass (domain: arm.com, ip: 40.107.104.78, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=SXiaIsM/kmnL7x0m3KAqdiIgXegSnf80MKfbw7U9mpz3dLBb9rhdXmBnaUN7S4f46W6pZKeGxllVCfXSqgFXf4RyCPzlicMLS8ru9AaOLzdq8bv6txNxh6SlPVUUweWF8qKk01INhy/FRr3lRuS+BcCmhNBrl1bPT1b3jjai4sP0+Er+GvXfl7wUOlr37VkAqnTsO/HgOPqqgp/qnxQKk8KTX2mfq6ktH6XGH4jNSgKpaKJYsJjb79EirFNIv5tgVnb4laCCm4MGy8mojltxhnTeJmhodxKzzt1uQfYlGtJuunZwMVZ5h8MEz0SuWzPBKNk+/ma7VzlNF21cBioYZA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1texvewPEnC06juhbLsZIuXWx6DTcuLaXJ9zro17n2A=;
 b=fTDFGWmGUv/nvuKYhpIw3IfPmmBYb7KxM0FEn1eZxv/LikP702Wl6nGchIfjPwZ5FBM2kpoxWifnWU3Io4xq+qUryUKPPj1P7JeOjSR7vbQI85EX2LdAbXmRqs4tVWWBowNuSPeHGFuixQeMNgKTy7lHo/at5eCS0aYrrQOcGqXw1rLYRQoi+hJSrQFNf9Yb7s0ya7V7hGNh44YtXcE9PeVCOMCh/NBmVBwJuTyGKFVNg1GSY8wsRQM2qM8ImJCWSL+B8sKRtw2PqjEjclTRkTyGvAqf77YI5fQ78CpftIuQrb1ITFXxRiEtLtiNr3Q2Yh1hg2i91RfFbiD808KVNw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1texvewPEnC06juhbLsZIuXWx6DTcuLaXJ9zro17n2A=;
 b=c2PxEoc1HEYeQPKokFAfr22/x3tuvp1NnBd2cyVI2/5OcJqw/uNfDaUpGz2wnLJx2yS5R4M3gZTcC+172VQY4+NJYFeUEfUUF1LUeo1a85pTGVs6TaxDzSxhT8wRPsOTnJ9nzv1uiUKzW5kivoy3pKX8Wl1zzdBmpstAFT9WKt4=
Received: from AS9PR0301CA0055.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::25) by DU0PR08MB8138.eurprd08.prod.outlook.com
 (2603:10a6:10:3ed::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.31; Mon, 22 Jan
 2024 11:25:59 +0000
Received: from AM4PEPF00027A5D.eurprd04.prod.outlook.com
 (2603:10a6:20b:469:cafe::c4) by AS9PR0301CA0055.outlook.office365.com
 (2603:10a6:20b:469::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32 via Frontend
 Transport; Mon, 22 Jan 2024 11:25:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A5D.mail.protection.outlook.com (10.167.16.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.16 via Frontend Transport; Mon, 22 Jan 2024 11:25:58 +0000
Received: ("Tessian outbound a297577ee0df:v228"); Mon, 22 Jan 2024 11:25:58 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: adcad4244a396f14
X-CR-MTA-TID: 64aa7808
Received: from dc79e68a0ffb.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 30011CBE-0FC3-4778-9A2E-EC7736428F1B.1;
	Mon, 22 Jan 2024 11:25:52 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dc79e68a0ffb.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 22 Jan 2024 11:25:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oZCKln6vIxdhXo/Yg3KyVFbh+lQoU+VUbC/5UiwnDfAMxqIXm3WHd50zMhb2jmtIEHzCummOdYUD6K98OYUADCySgdtbITPXpLlBW89sm1+U4oThTGygJJpQjzfN+jsTWPbjCGa7/a9VaBqat0Zb1l9PWFxmR3csZudX8CXSCYreDEK3g0mAeDKtK6do7U7dxgcG8Czl6jVDDHhY1VMF5ZgcEajbaSlhOKFojAOdWrXjYG/yvWJ/QsnUopx3/vmd+khLLhF82q3O6k5Bg1Uh7fy+6YTIi31cR88/yPJsLQx0cj9dLfZG3hhMh3FG0ZqrdNbZmUH1R26qFaHh2iikdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1texvewPEnC06juhbLsZIuXWx6DTcuLaXJ9zro17n2A=;
 b=PF6YDXwAK5acrvkP4dBpn8RN3L5LCD+44M1r+AMelign36xkwVYHzTnwuNerT7wuHHtk9ShSXNYL/hIxZxUyBerK8HLnew+odYOg0qsALzCCa1UYzu7bWuFf1M3qYHymgu82IqNG8otvuqI+5Nc8tDKCV5KYWFTarnJwAk4HkT6Kihl5d/Ps7+BcHZfLjhj3BBlYwatNIllQzoLfvChnmmHUX7p/2urxBOH7vFwzLcxrv7i1KFsQACQQCG0zs5w6P5F9FRZrkgNO7G8zr7qK0wUxCJqhX4AzGJp85n21rg/QC7cBNPe5FkwKWYkb/TSUAt4k09NVwTdNsqC/xN3/Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1texvewPEnC06juhbLsZIuXWx6DTcuLaXJ9zro17n2A=;
 b=c2PxEoc1HEYeQPKokFAfr22/x3tuvp1NnBd2cyVI2/5OcJqw/uNfDaUpGz2wnLJx2yS5R4M3gZTcC+172VQY4+NJYFeUEfUUF1LUeo1a85pTGVs6TaxDzSxhT8wRPsOTnJ9nzv1uiUKzW5kivoy3pKX8Wl1zzdBmpstAFT9WKt4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB6456.eurprd08.prod.outlook.com (2603:10a6:20b:336::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.30; Mon, 22 Jan
 2024 11:25:50 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06%3]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 11:25:50 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "mlynch@hi-techniques.com" <mlynch@hi-techniques.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] optee failing to build on head of dunfell branch for
 j7-evm
Thread-Topic: [meta-arm] optee failing to build on head of dunfell branch for
 j7-evm
Thread-Index: AQHaTSGBdC01fOkxHUi+8zec0r2QmLDlsTCA
Date: Mon, 22 Jan 2024 11:25:49 +0000
Message-ID: <EF84BE17-CEE6-45A8-9FCC-0CDD4BB6F111@arm.com>
References: <UuhE.1705687266596590169.nYL6@lists.yoctoproject.org>
In-Reply-To: <UuhE.1705687266596590169.nYL6@lists.yoctoproject.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.300.61.1.2)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB6456:EE_|AM4PEPF00027A5D:EE_|DU0PR08MB8138:EE_
X-MS-Office365-Filtering-Correlation-Id: 26046949-de3d-4862-4492-08dc1b3ce82e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 I394+rskJ7oXdzYT07uUKgpXKrYaSoorCc5dXS6ikKXENX/ytzmFD7wj88SW1AH2bswU1DYHiJiB/YUZuBoes4qjBMKHO9svJuEQSX/c6ln9w65l6Pcy4PYM4iD43R0c4rqBphbonXRZ1P4CsDOGGZUwIlrm39CLRRT0yZPS9wajym/zt0U1S42N7xU5L1Kmma820fV0LX0mdCiofjHqrcyN3xNIPMbUDSMEd3+Pd7vd+fg1cN0lRDCb2Te3s5GWpyb7prDMY8Q7hJvccL/qHAlS/+HfM7khJYtBHihLM/vyAWXr9IIlcjfmvCvGkCnjfmQRl8Eizk70uvrHBg4RVVlsLWb99HuIzqWADhexzUeXEgiC48KAE9F+xCPJ0lsJqTYEmL1eJHRAgiPfZWfBbNmP++5k6ElF9Ho/2YihWOavSDubeXKhe0+VoCJKAYOcHl0zd0tt4tdV5hPffo6253NqXNC7lkRyl0y6yp0IkGahhnWXKaOI/Hx7xpTTKmUKWgN1ogmlSfS5issotf7P8agvwyHi5e2wWLf9g2cEuZ0uV6Zec+gV66v/OHK3rZxVqsxPCU8C5MpzKXWXaqOPR03IURTrd+JALEs+R62O5F4xcoDkILji8q+IJyAnYZFMB96b/NV3diNk0SJWhz3QohDEsxOQnNTQ56UaXmdtSM8=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(396003)(346002)(376002)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(478600001)(53546011)(6506007)(8676002)(71200400001)(8936002)(966005)(6916009)(66446008)(76116006)(66946007)(64756008)(66556008)(66476007)(91956017)(6486002)(316002)(2616005)(26005)(6512007)(83380400001)(41300700001)(4744005)(5660300002)(2906002)(4326008)(86362001)(36756003)(38070700009)(33656002)(122000001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F3F1D3D5BA7A9F469777AD2C5C8E95A3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6456
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00027A5D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	038bb811-16c3-4c59-690c-08dc1b3ce2fd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eV4siWEeEhnVo0qzErz7LJRPSmHknuQ/T6ha4okZ2DYxcsDqvzTwDrMhvePOjmauxwc96Gfdmo0h2MBn4DIdP771CZfqmQ1/3Q1EL5tnq3Qe9MkQSfqN8wuFOIsKG1dwd2xPClUIvoY/EI8Tk/P4J+b33uZ0V39KxzbYtEVQUk175Z4hIveoLWT1F6J1BlA0HyDjul6P1eq1HjWQ3k+/XIPnihFtKiVkprBPauzMxpQx1MxiGWz5YRy0UxoIIS8MhEkEEkCll/oRz66/y/3vWvfvMI46SETYwLkMZJXvYqSFgvKoC79Mse6Rys7v5RbPHYMj4Exe9WCb6Jn03PvsjptHBlPBjfYB5w1oXjHXR6Gs2GBHN9+R0b7u5t4saZT9Sy1CXB937BW9RhBPlin+qQoXudQPbFFnezbrUAtO3HSmsSX67wkZbs/XpcAVBaAth6wip1mxr0raqK5JTTu/UKuao11f0skF2I6WliawLwDd5AlUl2u6THPXzCtOLeNyYfAnU5ypwOnTu/SOKkQiBJMjrC6r0JZaFP5hHIvPZOWSQd0qeicFjVacQcJnVkkjJOzWTjUQV3/oo5119Fy7L3FEOnbBCuwbPTnYRyYkdeUpIe6NUdXkbB6VyicQFIe8CYUaRfKj6qBeoNx7IurpwHEvaGpppv6Ww5z5D0O4kGFOWTAlROIUxQh6eZfNWc/LYMUC7D1FZBXFueRN8oYZCDNUN76I6mbEqIDNuD13B9VJASE84LA4kHM4qEWJWgegiJqXGV2LwWIPxxudppJB0A==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(396003)(136003)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(82310400011)(1800799012)(46966006)(36840700001)(40470700004)(40480700001)(40460700003)(6506007)(336012)(2616005)(6512007)(53546011)(26005)(36756003)(81166007)(86362001)(82740400003)(33656002)(356005)(41300700001)(83380400001)(5660300002)(36860700001)(2906002)(4744005)(47076005)(4326008)(8676002)(8936002)(6862004)(6486002)(966005)(70586007)(478600001)(316002)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 11:25:58.6633
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26046949-de3d-4862-4492-08dc1b3ce82e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A5D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8138
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 22 Jan 2024 11:26:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5349

T24gMTkgSmFuIDIwMjQsIGF0IDE4OjAxLCBtbHluY2ggdmlhIGxpc3RzLnlvY3RvcHJvamVjdC5v
cmcgPG1seW5jaD1oaS10ZWNobmlxdWVzLmNvbUBsaXN0cy55b2N0b3Byb2plY3Qub3JnPiB3cm90
ZToNCj4gDQo+IFdoYXQgSSBub3RpY2VkIGlzIHRoZSBTUkNSRVYgKDAyM2UzMzY1NmUyYzk1NTdj
ZTUwYWQ2M2E5OGIyZTJjOWI1MWMxMTgpIGluIG9wdGVlLW9zLmJiIGRvZXMgbm90IG1hdGNoIHRv
IGFueSBjb21taXQgcmVmZXJlbmNlIGluIHRoZSByZW1vdGUgZ2l0IHJlcG8gZm9yIG9wdGVlX29z
DQoNCknigJlsbCBzdG9wIHlvdSB0aGVyZS4NCg0KaHR0cHM6Ly9naXQueW9jdG9wcm9qZWN0Lm9y
Zy9tZXRhLWFybS90cmVlL21ldGEtYXJtL3JlY2lwZXMtc2VjdXJpdHkvb3B0ZWUvb3B0ZWUtb3Nf
Z2l0LmJiP2g9ZHVuZmVsbA0KDQpUaGUgdmVyc2lvbiBpcyAzLjguMCBhbmQgdGhlIFNSQ1JFViBp
cyAwMjNlMzM2NTZlMmM5NTU3Y2U1MGFkNjNhOThiMmUyYzliNTFjMTE4LCBhcyB5b3Ugc2F5Lg0K
DQpodHRwczovL2dpdGh1Yi5jb20vT1AtVEVFL29wdGVlX29zL3JlbGVhc2VzL3RhZy8zLjguMA0K
DQpUaGUgMy44LjAgdGFnIGhhcyB0aGUgU0hBIG9mIDAyM2UzMzY1NmUyYzk1NTdjZTUwYWQ2M2E5
OGIyZTJjOWI1MWMxMTguDQoNCkl04oCZcyBwb3NzaWJsZSB0aGF0IHRoZSByZWNpcGUgaXMgYnJv
a2VuIGJlY2F1c2Ugb3VyIENJIGRpZG7igJl0IHJlYWxseSB0ZXN0IG9wdGVlIGluIGR1bmZlbGws
IGJ1dCBJ4oCZZCBzdGFydCBieSByZW1vdmluZyBvcHRlZS1vcyBmcm9tIHlvdXIgRExfRElSIGFu
ZCBidWlsZGluZyBmcm9tIHNjcmF0Y2guDQoNClJvc3M=

