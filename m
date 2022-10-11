Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A093EC433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 15:54:21 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.79])
 by mx.groups.io with SMTP id smtpd.web11.9223.1665503654227668042
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 11 Oct 2022 08:54:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=jvxho0We;
 spf=pass (domain: arm.com, ip: 40.107.2.79, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=FLmZ5cNfzzP9YL3h/Px3MxZ/v3YZDXaRywhteHP3Mt/p2Mda1lVc6tVc7qGmGoEr45MKlpMS5gzpzfLCule7jgqXuwvngPnIAD+MGHLgG3V8/rmnqKz8WwNHjceoexqbYdsSL4/gos8RLf13jDGbAtJxhyPfQzK+/AvwSqpTLVtHzNFugy5h3QJ1xqOwxIJz5B2pUr/VJ1QTby1adhsA/LTClaCxgXuasnasaU/mc2lZrj5QvA0TNpuIjkckcZCa3n5+biFj+FnYU18tb+/bzAmYSGt4tldEIZaE3h4UDLtUBOXIyYM9Q4zzXFnzpQEJA1vu6Jq3bfkSPUrP04KmbQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OMth/7jv4kT2FRyJJUKesGZzgP5SH6fK/WqRCrImB8w=;
 b=mYxl3ATHKyj4OVhk2CGMmJ8L+D6RhEmZoykgbL/3Ih1X10x4Z21/+WpqXe4HGnYtItyTfbCXh4PTVh92v9J1WNq7zNFWPZar9oH/81Vuh4bqtoaxCsSblxVY5E7N20xRHeKFKzbeZOnieneSSeaDRWzZ75SE3e1aobAT+mHu94JHHSYGoY2nmYx7k/p6HrHU+pF3fHdojnw67Dt20oKZixCcf8W99/XQ7uruom3vFl6ui84/2tZ3Af488g6tMQfcJRUP13vftYTcyl+UzZ0s7r448LQ2r2CZ7spC/YVMdviFHkflMHwWNLeOO7hLE8sxs4yE7mT4fDyWNXi/t2v7CQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMth/7jv4kT2FRyJJUKesGZzgP5SH6fK/WqRCrImB8w=;
 b=jvxho0We4z7+VEKtBBFCZCHz8rSqPG6U0+RSI93J5IQ8K+HBwBKJ92Dny5fdWd7VO/GDRBzS6L26rBwjH/LXgHEW0HlOq9sXUZ+OEAMIMKQwAksGJwjBrVxuc26MI+4IDXwr4YOTQghf8q0TBJRaYCNVVf9X8MMKxvAn1f6x2Mc=
Received: from DU2PR04CA0043.eurprd04.prod.outlook.com (2603:10a6:10:234::18)
 by PAVPR08MB9039.eurprd08.prod.outlook.com (2603:10a6:102:325::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.19; Tue, 11 Oct
 2022 15:54:10 +0000
Received: from DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:234:cafe::37) by DU2PR04CA0043.outlook.office365.com
 (2603:10a6:10:234::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15 via Frontend
 Transport; Tue, 11 Oct 2022 15:54:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT034.mail.protection.outlook.com (100.127.142.97) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Tue, 11 Oct 2022 15:54:10 +0000
Received: ("Tessian outbound c2c2da38ad67:v128");
 Tue, 11 Oct 2022 15:54:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0113f2161fd58e62
X-CR-MTA-TID: 64aa7808
Received: from 31b4efd285f6.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5A1B863B-E30F-490A-B77D-640B06327406.1;
	Tue, 11 Oct 2022 15:54:03 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 31b4efd285f6.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 11 Oct 2022 15:54:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OfrG2QdzBxk5DrGedfGkkMeHAVz7KHVwiHMNANkZRtws//cToVf72o6nz1Vx8QARouSDyOiKWKUkx5ESWrXTQhMlzhuK57DXupjpFL1MXa6bIIlDLYomRYoAgrK6HUFTGR8ab7G0a6mxx3pnbGr/W2j09Vb6jlhpEeq3gq/E+T1sb6E2OfX5S2qMcPb6sUoMaT0Hu5Gb/0tmuYvoYYlz2t51C1wRGDxK9LOzlE+EcFdrd21Fsu1RiVhFdaTxgLkpejR7069UTMgXqXWhhIMWtomgTrBdWRUoeWBQzEExgDtJRu/Lawk14bw21n/u6tOJiKZYlcy5hdHKYnZhQzNFEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OMth/7jv4kT2FRyJJUKesGZzgP5SH6fK/WqRCrImB8w=;
 b=JMS9hHBUai0X/FqqQZ92xNH8lxAQZT4amtjVNGxzPEMs80Rg1b6XDLxbxXDOoOg+5iyiL4wqVyvaQP+7/fBC7pjHnnOzspnTiI8P43NsKfuz/AGnFbkXspENwRSGHjI+TRSpT1LtSm2PWc4qBi5DZpptIJRUHTYxeOnDd+OiwQd2UGyti6BhqNH3TCdt+R9KWPHkoztiZfMEpveza/ysOBLwwRnS1CkYnRpBVa6D90YKvcEXdtr9wS8/qfXdSXNilgPUSVANTCO9RibiW9v267FaM7Pa9L0FMVou/1Y9PEL0vJQB4/1LPsFbfK6QxEp4U4zP2eUv7I3ph/02g6W3ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMth/7jv4kT2FRyJJUKesGZzgP5SH6fK/WqRCrImB8w=;
 b=jvxho0We4z7+VEKtBBFCZCHz8rSqPG6U0+RSI93J5IQ8K+HBwBKJ92Dny5fdWd7VO/GDRBzS6L26rBwjH/LXgHEW0HlOq9sXUZ+OEAMIMKQwAksGJwjBrVxuc26MI+4IDXwr4YOTQghf8q0TBJRaYCNVVf9X8MMKxvAn1f6x2Mc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB7888.eurprd08.prod.outlook.com (2603:10a6:20b:52f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Tue, 11 Oct
 2022 15:53:57 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%5]) with mapi id 15.20.5676.028; Tue, 11 Oct 2022
 15:53:57 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Jerome Forissier <jerome.forissier@linaro.org>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH] CI: restrict compression threading
Thread-Topic: [meta-arm] [PATCH] CI: restrict compression threading
Thread-Index: AQHY3XUiNiXvKRg0FEKNH/Hq8G+LI64JWGwA
Date: Tue, 11 Oct 2022 15:53:56 +0000
Message-ID: <EA6C51D1-4964-42C9-B4A3-67321B61246A@arm.com>
References: <20221011130710.1638676-1-ross.burton@arm.com>
 <e38df151-ce95-aee9-e929-c10f6403bd15@linaro.org>
In-Reply-To: <e38df151-ce95-aee9-e929-c10f6403bd15@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB7888:EE_|DBAEUR03FT034:EE_|PAVPR08MB9039:EE_
X-MS-Office365-Filtering-Correlation-Id: 06c15e30-5016-4a97-0f46-08daaba0d675
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 aPlTra0uD6hi6D87LqkzoSMMe7RQa+yaSQR+/HSlBVq2m48u5CLBLyI8OwS+j55T0uH1pERtmmQ+58/U2nSTWilFbaBTxXeIfevUkXSs3qHuG6HHzRITvXMpmUTUobnV5LVWa5XwyehMZAUzudSirkrWmrxeTQmK/Y73bPJJ5viqvRQTe7fwLBkVfopQjd9nqVspDq/T+3pBU73qmECyhy7HeyfQwVv31qWvj5ZVmAzWFEj+U7QELzzgAF+cYE63C52F8cIoYQMYA81TT4z3g7CvzQFvBsE1HqMkU9cHcJkHqVJeeUPgJlAs3cxDj/zD/26eJK6LBF15XVAc8IFK+2cxi1Nq3RqrAynTQd8N69YrkFQQ6tYm4oAgjVpOjKvjYaSZT1JfTLH3roZQR+z7E9BQ/l1IFgctXhLJZzh9VsM0sDlucYpbxmc7nXIItdWdj+TzdEFNlRC7yaASIh/t/kugWDHJbsutl2BocBjVD8L52F5LN2Ww/obz65cMN1qf0JwJB9hisdLiYLCIUFa59FvhS4Odgq+cIV3JNS4+8AjhRHj4MnWSGVZ7ChKQWDVqV4qEox03i6+EeCryz9k5DztpZZFpp0VwQtK+8wh1slwsCGcILG8doLcb/Mj6C1q3MkJXajhvDiQaZzYQDBRwxi1VlsosA+z2LYhyCd69rAfRSGIFlaArgnCYfqLT1AT/UokR+eyRfuSgYHHOLc4r4B6d/V9AKIW6GMoYfb1CDLP2F5WeRCvWNOShzGIpxcKFpwSMCYwIgYkY6gPbBt6ognQx/IFH6hT7vsS6TZom5+k=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(136003)(376002)(366004)(396003)(451199015)(64756008)(36756003)(8936002)(4326008)(53546011)(6512007)(122000001)(86362001)(33656002)(38100700002)(6506007)(38070700005)(2906002)(41300700001)(6916009)(66476007)(6486002)(4744005)(66946007)(71200400001)(5660300002)(66556008)(91956017)(76116006)(186003)(66446008)(83380400001)(26005)(2616005)(316002)(478600001)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E2E0D84E7729F84DA6712D416D5BB3DD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7888
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8257b981-2d6f-4b41-15e4-08daaba0ce47
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gpOnhwH+3CDzk9x299yUzbZs5ZEpyfujAAUcuJRNUTROczwpp5sJNvi2HfT2GKtpK9CtQXTDwbkFuS6G58B/q9Mf01fgmO8XKr9Zuph3HMY6h5cZJCVoSTP0TMzrzcwEGmEEvB2nB+qSE8BGC3x8sLyq2tIU/8VEKY5CfWC93NIaz3kBCsk1rvenLe1BukT2rgwRo5vSKs79cUs3AZmSqNIL1FPo9zcL6jwb9aLegt9SIUHrEwv+V8IFdDrzXrapbUZIk6/cSB89hZR2luYzRTzwBsGbLQB3Yj84OVjhL5sJmLcVSpV7zxY3mZuR+d03ojzYhTjWnuRKWWHS94e/m9GvwjIblzWHnqQn6KNi+FZFjCh8G2qphNytWoMyT8rU9ld/LuVjPQ6cVKBrpBnH9PAXwBE84Oxn1L6rSX93flEPtvmTMdVnaRCyQY1hWK6Lf+ssdke/VhCpFjH7XkaRDVmYviAX9tNJL1tvZ8xUhVEznTNbFiz4ETDcK6UB5zWdZB9Alk3v5ufqm6FAKxr25OjXmsUJjUh3lY9hhWA+rjlaFTG+lqv4SyPVcJ4oIJqmYNC5n5rVqm6JJFbi8/iYTzvUpCmdTONEWMsvJQ380DaUH8W6Znt6msDOZW4VG4IUZ9oQFLWmZQHDQsNB+LMF0x0A/Y0dLjz1/SSAb1FYcyJEcVXRhdPSxUR+zW0tyA2I/MLsHygRYn4qQnueOxP/TfDLR4i4fm1I0NFDi0xxjszW41EHnaj7GjyShh5366WrtgP4zg2fQUC3TQyRth6/nA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(346002)(376002)(396003)(451199015)(36840700001)(40470700004)(46966006)(316002)(70586007)(70206006)(4326008)(8676002)(6486002)(478600001)(6862004)(5660300002)(26005)(41300700001)(81166007)(47076005)(356005)(2616005)(2906002)(336012)(4744005)(8936002)(6506007)(6512007)(186003)(53546011)(83380400001)(36756003)(36860700001)(82740400003)(86362001)(40460700003)(82310400005)(40480700001)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2022 15:54:10.7459
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 06c15e30-5016-4a97-0f46-08daaba0d675
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9039
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 11 Oct 2022 15:54:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3954

On 11 Oct 2022, at 14:26, Jerome Forissier <jerome.forissier@linaro.org> wr=
ote:
> That is arguably wrong already, because it restricts performance on >16 c=
ore
> systems. I for example routinely build on a 32-core Aarch64 and 36-core
> x86_64 machines. Yocto builds are painful enough that I don't want to spe=
nd
> more time than necessary due to wrong settings ;-)

Hypothetically, sure.  Do you have numbers to prove that setting all of tho=
se to 16 is noticably slower than setting them to 32?

Ross=

