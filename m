Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 815C9C6FA89
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 15:06:54 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.53])
 by mx.groups.io with SMTP id smtpd.web12.11235.1663254406353605337
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 15 Sep 2022 08:06:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=f8HApk5t;
 spf=pass (domain: arm.com, ip: 40.107.6.53, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Xnb6yv2J7Xg8yhwxANng5Eso2xpo57RsiN+uSENERYZ/1p57C602d8AbwVKfD0UZKFhZgWa56HH4up3yVwUqJnqZI62b3hieF0KTVz4NICZuO8Ra2I0YGPz3ffcfWj+ai7lCByAY5ARwt1PsNe6pWorgOquble7NOJaX3ERr8Ks92viAkv8CrhZxpGyifvP6Gh+FotEXk8fGCx5iMA4kd35MxieiY0CdQy8r3qaHTPRRg2mxG//ryEFL7sVTwiiPhP379zKIkwclSruRVx/fuD9ZcvJOogjW9cKlkBaZ7/lqg/662nM2rMERH4WX4UooBtI95CO8+xq39GfrlRKkfg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0KJsRxnNwsuK+m3J3Do0LspaFAk5pdD8rOPSDE7Yjvw=;
 b=UhDbLICvf/QhaWFXvQ/do6bexDqHrUsuaEm6xaqjgoqUmDnABfjFqVP4jWawsVenwYI6jssfYZiULQx97WRQdKBZd3ZcxmSl/xC6LIbL5vJOeGiWktbl/xHXZpsvvUCeJhctqL51aiKRHDHbneDfjA58iywBmhk0GdghCVlTcOHfI6bBtE6YmMUWmmsHUyRZLtKgT3n1dXjHWpNtiBqD8W/LpuI4iG19p3EollJjbMF1HgQVcz8SObhQuv7O+Jh9220eTq0WpYpHqqW6EMA5nHNumwBrQDBscVViuIfRJoF5j/C8gag/wfv57ppaUFUwrw0R1gFYPj4pkBQZEXgyrw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0KJsRxnNwsuK+m3J3Do0LspaFAk5pdD8rOPSDE7Yjvw=;
 b=f8HApk5tvnwxbUe0y8CQewmKaWHEPryrHGZG4Ht+36sKo4eWWyDgCJ/T5RhU+xsTyytkeaBucBztXUH09ril5DxhfeonZQd2DznHCFw4od15xTQPVrv1yKI2aIOYE27X1Dhub9382+pKAHdWjQ3oW1eM31s2rw+RuhyTh7OxkUg=
Received: from FR3P281CA0001.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::10)
 by PAXPR08MB7336.eurprd08.prod.outlook.com (2603:10a6:102:223::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.14; Thu, 15 Sep
 2022 15:06:40 +0000
Received: from VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:1d:cafe::98) by FR3P281CA0001.outlook.office365.com
 (2603:10a6:d10:1d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.12 via Frontend
 Transport; Thu, 15 Sep 2022 15:06:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT039.mail.protection.outlook.com (10.152.19.196) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5632.12 via Frontend Transport; Thu, 15 Sep 2022 15:06:39 +0000
Received: ("Tessian outbound e2c58cd9a6bb:v124");
 Thu, 15 Sep 2022 15:06:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1332b0ff7bbcf203
X-CR-MTA-TID: 64aa7808
Received: from 6c2068ccd112.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 470810C5-3048-41AD-9346-9439B1D11826.1;
	Thu, 15 Sep 2022 15:06:31 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 6c2068ccd112.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 15 Sep 2022 15:06:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iBz915Wd93F/hI9wBiO0pk77u5VTUc4Dz1I/Ku5H30rWEJCNWNNXOLOLFQ2KWJwf5Hkn+ju5kbowzfvTDipfZWkNuLzVsmnJr6nmWuQTT05qrSfnLpVqFiVZGypb/I+UErZ5E2ft7pbgWkSOAhZUCHobuYU9nzv6+4vE0GcFkeFYHjKqfWxt1q83qyLM0vmU6nIJWnjiCgl+0o3TordxWPqUb/p7ZbwWmsugl644466QylFgg4+mabWl5Pp3dSo/2WKszHXGaXPlCuw9urxx3o3CBwXOH6KZHZysKfN8loXwnvBhjnigG/UPA7wPrrVrSip+RHKOYoCeGDvgCTDVkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0KJsRxnNwsuK+m3J3Do0LspaFAk5pdD8rOPSDE7Yjvw=;
 b=fs2KjYi6mPGfsFBZ4eFvXThmjQonPCykzFfMHBxWNjXYIoWofA8sL3Vdy1u1qGfp2VHMHWlWx4IfS1JQn6bNGrdAP36y5nc2X+q32Wh5bxdBkcfxDtGX/sqPNhk8szA8MZ5yQ9BMsGF1wIaxz1ysX+179zvG5EqsF33OurI1jz57CaXrz98+xwj3SMQXK4ZquBtzgROZxX7XHeLII7aj/jZbJMiGUB1vFpC8FFFLQyOkoHxmkvIhMu4BAT5fRgCk8+u47g5AK8IDqXfUqU7knozELbvWjAl2lHuEIo/tqxpqo6IQCpOlGggGuS7dnxGTlTE8ziaKTDCDumDLhqJGhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0KJsRxnNwsuK+m3J3Do0LspaFAk5pdD8rOPSDE7Yjvw=;
 b=f8HApk5tvnwxbUe0y8CQewmKaWHEPryrHGZG4Ht+36sKo4eWWyDgCJ/T5RhU+xsTyytkeaBucBztXUH09ril5DxhfeonZQd2DznHCFw4od15xTQPVrv1yKI2aIOYE27X1Dhub9382+pKAHdWjQ3oW1eM31s2rw+RuhyTh7OxkUg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV1PR08MB8154.eurprd08.prod.outlook.com (2603:10a6:150:92::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Thu, 15 Sep
 2022 15:06:29 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::a108:b98f:c57a:1d1b]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::a108:b98f:c57a:1d1b%3]) with mapi id 15.20.5612.022; Thu, 15 Sep 2022
 15:06:27 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "andrei@gherzan.com" <andrei@gherzan.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: Re: [meta-arm] [PATCH] edk2-firmware: Fix configure sed typo
Thread-Topic: [meta-arm] [PATCH] edk2-firmware: Fix configure sed typo
Thread-Index: AQHYyQVW0wn73R5lwE61whogMxKo4K3gl2eA
Date: Thu, 15 Sep 2022 15:06:27 +0000
Message-ID: <3CC222DA-0230-4E52-9FE7-B1D2D9437344@arm.com>
References: <20220915131530.1677573-1-andrei@gherzan.com>
In-Reply-To: <20220915131530.1677573-1-andrei@gherzan.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV1PR08MB8154:EE_|VE1EUR03FT039:EE_|PAXPR08MB7336:EE_
X-MS-Office365-Filtering-Correlation-Id: e291ffec-6ce9-45fd-498c-08da972be471
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 JOFHVJpLe5XG2OOL0lDpJcFUwYyy+Yyh7Fx1K/7mu9nL+jtmV7uzP43KtW9KyPL2PDKkZNz39wMrRHZWoV5ve9n5P2x0osBvV1rUVtt6ZASaRd2EIlpwBmumiicRa/1Ab+XZsmQ2por8rUNmpod6zv+yAasMAd7QvrKDNrav0Omh6EdEE9OokkSun9OzpQ7koIUwq8uz4K75UB3D+NXrABkecEc6e5YoJ38o+HcPJZh6P6lAq0fp/vUC3ITn1BNaSXcIaQNxFOxozMxwDTUteCOxVub3pjtzQloy6gNPIdG4EiqkDisfE3qf4R+AoAJCVy8jftwXJIXxvDzVwiGt5C1gwmd25A8OkPB6M9Tb8wNGFIN4gNZEgsf1ewtvhs5YPfx4znKYSe0KygoHSQ4/VlECNQIPONoaTeVh9k5t4oaWWUr6TgsniWDSPa7Gfjvd6ooJu4Itz8uf4fMU6EOUH3q/SYQub7bDAuEN6qudyBtgRz5sExTSq+wCFy1AjKKkMpHxfI1G1SG5eQAaDM3r07JNfT8AlYjwCX4taNqfjwDj0V5wOn+Ujc6mZe6QCUIRTv/7TYfgEU64dkxICoWoXrR1WXtldThEkMm6U77MU9T4KmSPvjKGcrhDV5S97sjgsnoYYI+e8KcdF4ZDSHApAOvbSxteVUwWe1v4MwGpcECdAmIwbLBHzUr1zRlyXa5WFA4M8kMoPen1tBTgMUCZDVQkZLI24ncFMkXZJsIqp94B6B/qZeEIYu+IMFdkh1wgkDV7ht3lGWfzwobCFigOgnFqUz1yWGqs5fq2+0ptMZQ=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(376002)(39860400002)(396003)(346002)(451199015)(91956017)(316002)(76116006)(6506007)(41300700001)(186003)(2616005)(38100700002)(26005)(6512007)(4326008)(36756003)(6916009)(6486002)(8676002)(71200400001)(5660300002)(478600001)(33656002)(38070700005)(53546011)(4744005)(8936002)(86362001)(54906003)(2906002)(66476007)(64756008)(66446008)(66556008)(66946007)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E1F93C20D5AB794B8CE5277C9739AF2C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8154
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0467fa99-6be3-42f6-d8cd-08da972bdd20
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ysk125Kj2hTjOAccBwHn3gqd0WEjpcnd/xtxZ00w0ICmf1j6fWOcM2Hhh5I/4/iV8Kz6zVSpyI6waAqjaMaMfwyi5rTwRAW69UfvxAYdCNp+OccGQZ0//2dI8Uu0JFMmJLxgFsDkZWngV5pYzfu+a2nszz/5efb1pwMjSM4ni934K4CplvqdLEEByfogUn1666SFAEmKrokz+SsHDxb/iPsmnSwHmv7u2al0W76rmFcA+n3fxjEERGO/DtpsnoRJW6ost80giX1PBa2D2RICjL+Y34P3qcEhPEmfgEJooeOp/wXZBS2pNDRVHu+/UlF7lEepUqviQbtwvXVNrZ/FzWgDLkY2rjVcMJ6YQr7tWTJlw74byuZqFebtVvKN0HJvKEJOQTnoduCyYHWhgPAfWO81qwZ0UTDGEFpmTAYMUn6lN/JhceZY0mY1/6NCj702BBpVAvNKsMQ2powSUDJY+lOpe5bOnrnVhgL0Sr+tuUTdV+yPGEIGtv2bG2BLPalUjov2fMIx5gJ3RbeD9VIMrzmhiuCvmi167aSARmCmKtvvH7NGGdqxOe2fuqDUXon1C4p+515QDTPI3i1ddhcsCVltqgo2BQ+2wSR8A7fsL8bCp47B0qHOXYozTL9HIS6mbiAfLVBeU6QbDN72sZvdatcHAttNhGoxYY0ACZwfzJsnmGfR7PsqXSS5AFg/1PsObQ666Wab8fCoz+UlUtR2Og6rVcavzzUnsw59Wh2oYXVxE4dgFv+DIZV6enzFkNY9wcs3dD+RZtGU96Xk8u0X+w==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(346002)(136003)(376002)(451199015)(46966006)(40470700004)(36840700001)(40480700001)(53546011)(41300700001)(26005)(6506007)(107886003)(6512007)(82740400003)(54906003)(316002)(33656002)(478600001)(36756003)(6486002)(36860700001)(356005)(82310400005)(40460700003)(336012)(47076005)(81166007)(186003)(2616005)(86362001)(5660300002)(4744005)(6862004)(4326008)(8936002)(8676002)(2906002)(70586007)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 15:06:39.7270
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e291ffec-6ce9-45fd-498c-08da972be471
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7336
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 15 Sep 2022 15:06:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3787

On 15 Sep 2022, at 14:15, Andrei Gherzan via lists.yoctoproject.org <andrei=
=3Dgherzan.com@lists.yoctoproject.org> wrote:
> -    sed -i -e "s#-target ${HOST_ARCH}-linux-gnu*#-target ${HOST_SYS}#" $=
{S}/BaseTools/Conf/tools_def.template
> +    sed -i -e "s#-target ${HOST_ARCH}-linux-gnu.*#-target ${HOST_SYS}#" =
${S}/BaseTools/Conf/tools_def.template

Did this break something for you, or is this a line that can actually be re=
moved?

Ross


