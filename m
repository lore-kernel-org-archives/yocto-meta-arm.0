Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C4CDC43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 17:05:23 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.83])
 by mx.groups.io with SMTP id smtpd.web11.29852.1658163917350425219
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 Jul 2022 10:05:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=yb+Jkjtu;
 spf=pass (domain: arm.com, ip: 40.107.5.83, mailfrom: peter.hoyes@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=HRKpkKO3Iz865WquyUmMN+e7BswQedfZ0itV41YYLw9rakFCxA0HGrtL/3C+WH4kfapj0DwHtrxePSOufoE/mnIG0LpDmjvYz542M/2toAOVic8KW0ZUumahKsRhhErUj3VJVCQq/Km2VsZwRCFm3g/q2CzhCrGAIw6w/udzvPZA3sH5VXcWPbTslsurH/YMM23ehVl+DqVtiNA/7NFtqAF4wxNjd8ApM8KXo3n3Iw/pq8yZkg8VGx6IEoV9CZg8yPuuoKplwj5HPzwcXNbAB3FDyOLrGPdzSFZhovoK4o/SB/KmjAOnX2ldgOAXKIOasyCmtoIYZOU7a2wPxsJerg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w+Jy4kRXsbgyq6Q7mpKjrm1R5a7dLx0GY2Jq+9dxr44=;
 b=FY8AFa8430vDdUPkmGKaOioFUKrPO4El7DlhKQjlOx/exuCwgVzNOQi7Qyitwp23p3qy6EJaSY3+4Gk6M88pcqANK09M3t7jPAYYtMure67J4zSIM/gJD7BcGdiLYwvOhMjBhBvrJm7j1O3yxgps7wBZy+rqFRg5WFbWgw4i+wskEGTGlGq4rU8K5CdpkACZarlIInww+otVanv0TIsOziid9euniNJ7XF15aYVX1slSNYGovTzscGHpjmUSQ3YdGCfzlU7cLFRY8V/K2lfJq6erKSP8x9wGsbtIHD5BpM3DbXZP8BUAu6Bn9nfkpZhdOS5zyQU2DXRqc3jWCJ3pcA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w+Jy4kRXsbgyq6Q7mpKjrm1R5a7dLx0GY2Jq+9dxr44=;
 b=yb+Jkjtutv/ShWEFQTRrLoQB7hFHO69gmoly/krspN/0ynHtOQKmrJTHPQVkn7gJyXa7VK59WnaWU74SxTzczEVahGClVSwHV5ZH1mjZuA9MQE5k3qaklzTe1MnhwqR1RU8m/Wrno7/7t+VzAxhPDMgd31V37OfkvWXLano8VOw=
Received: from AM6P195CA0034.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::47)
 by AM6PR08MB4981.eurprd08.prod.outlook.com (2603:10a6:20b:d5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.15; Mon, 18 Jul
 2022 17:05:12 +0000
Received: from AM5EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::ce) by AM6P195CA0034.outlook.office365.com
 (2603:10a6:209:81::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12 via Frontend
 Transport; Mon, 18 Jul 2022 17:05:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT053.mail.protection.outlook.com (10.152.16.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.12 via Frontend Transport; Mon, 18 Jul 2022 17:05:12 +0000
Received: ("Tessian outbound c883b5ba7b70:v123");
 Mon, 18 Jul 2022 17:05:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 72758636710a1161
X-CR-MTA-TID: 64aa7808
Received: from 4dd9a1830a4b.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 141282FC-6A62-4F69-A2CC-6383A43C2511.1;
	Mon, 18 Jul 2022 17:05:00 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 4dd9a1830a4b.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 18 Jul 2022 17:05:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WR8HbTPHficEDAi8YNkd2vcQ3gxaQ3YWN0BsfdzTmLnXfbhdMZc54nheSv0iyaEEDlF3pWRiWIw8iX5aFJfe7i/vet3B9UakXuazSjSTSQVim0ligc4eMysHYn98FGNexB06yKuYWPMfJDQgPC92svcISwBR9dZTbG5a46B+J/zcW6T6z+mjqAYSK/UqGVq2GyMvyGlmmVUsfI7xULB5xAMU4/R3+WNGp134roM0WCIrOYKV6egGwbqhmbuF/Fj2x6uQttkZ4/PsNfg94wxIa1Wo+cEnWlaBsxSHIIwWdXKSU8q1kPY3yBK9fuE//4sViDjoj324rIUd0r7sYfWwHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w+Jy4kRXsbgyq6Q7mpKjrm1R5a7dLx0GY2Jq+9dxr44=;
 b=liJyO+uv0xskpDwizcNz+3V6lY/UvFteTD5eEt/vECPa/1Sv6hYZnIiKetlCYCcSXUoogY58MjrdKvj5HYe/I/uGV8ezEhllC3MYEGgg56iCkTS6eaZJQOu7OX5jaRO2AmglOIiyp+kTFPAx1zjSLbn9+MfE7aqvRWoMIci4BfxZhWecZ0+5VTvPGbFInxcFVI1/EEJs7l0t0G8dErsJFgDNZpb5phT76Sjw2iBpuabUXZLMlYAqdj0G2Vkhkiuu9NtamOfqa1P6FG29nmX2nS7KIQF1WNNORkU4BIigyJLANxqrw0hH7Qhs6NWbg4U7Yexidi7FghmKICU0KCLVOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w+Jy4kRXsbgyq6Q7mpKjrm1R5a7dLx0GY2Jq+9dxr44=;
 b=yb+Jkjtutv/ShWEFQTRrLoQB7hFHO69gmoly/krspN/0ynHtOQKmrJTHPQVkn7gJyXa7VK59WnaWU74SxTzczEVahGClVSwHV5ZH1mjZuA9MQE5k3qaklzTe1MnhwqR1RU8m/Wrno7/7t+VzAxhPDMgd31V37OfkvWXLano8VOw=
Received: from AM6PR08MB4280.eurprd08.prod.outlook.com (2603:10a6:20b:b6::19)
 by HE1PR08MB2811.eurprd08.prod.outlook.com (2603:10a6:7:33::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.21; Mon, 18 Jul
 2022 17:04:58 +0000
Received: from AM6PR08MB4280.eurprd08.prod.outlook.com
 ([fe80::757e:a66c:ec06:c072]) by AM6PR08MB4280.eurprd08.prod.outlook.com
 ([fe80::757e:a66c:ec06:c072%5]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 17:04:58 +0000
From: Peter Hoyes <Peter.Hoyes@arm.com>
To: Jon Mason <jdmason@kudzu.us>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, Diego
 Sueiro <Diego.Sueiro@arm.com>
Subject: Re: [PATCH] arm/lib: Improve FVPRunner shutdown logic
Thread-Topic: [PATCH] arm/lib: Improve FVPRunner shutdown logic
Thread-Index: AQHYmqAR2dOwuUIQ5Ey7q9rXePuSIq2EWo2AgAAAWBA=
Date: Mon, 18 Jul 2022 17:04:58 +0000
Message-ID: 
 <AM6PR08MB4280FFAAFCB128C05A3059F7FB8C9@AM6PR08MB4280.eurprd08.prod.outlook.com>
References: <20220718121533.3274181-1-peter.hoyes@arm.com>
 <YtWRtfxSngy27BpE@kudzu.us>
In-Reply-To: <YtWRtfxSngy27BpE@kudzu.us>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 39ef57d7-c148-6d07-10f6-a58a6c96ee9c
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 813d9bb6-9fe4-42a2-e6d1-08da68dfad5d
x-ms-traffictypediagnostic: 
	HE1PR08MB2811:EE_|AM5EUR03FT053:EE_|AM6PR08MB4981:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 CjfjL/iHAAUFGCcsnTADf+oRhuSt8+gFUYRxWOYM8iwDVi4q2sqPBjHIRpfnk7SlF0tLZMd9moOFBzuaR68xDN1Bp6DiRK9aVK75CncgL5teturVIxWsknmT5z6g+qCv/Jg36KDqQt9sdcGepC3PdQepnIeP/mOJ5TQbVwKMtSHTT7secA4SBsB1wiJOCBIz0UHdHnN5qxMwhbnmaX+BtB/BtAq5Y372pMvwvi+WuJdwIOxdR14kOH03eTtDnlvgI5THjQee+nOaWahuGv4b50S7i6FC8uJhfqFT7bdCm+th9Hiew/SMh0dz94AGLrg8xuQVV2tyeuWMaK9LL4vqliWQKoYUqVFOKogYvVzA4fV2+RkzaYDsPn2fLUydOlBUpL5kVIuVAbM8bAlkUWi6F3TcXFR14FYKF3w+zfuFTcfc3tuIsMgwbAbx9YQ/dpmNAPGh1c5zH8Jss/5RbZQx1AiERMt72ju+6Vn60JifX78vBvxTqdqB+qsSsRzLrDBlFZNKsWkt/uUhYz2ffHxqW7HrOP21j4QXtf4AuNIvAAWc/2GwgO0NFqA0QsiuK6/eeUvUAa6HOmQ0YCAJeM0MNEFmq1Wp6wujIoT2KbZipWKUC4g+9wNT9isBe/UPhMh2koJwUF8XG10JC5UGziKCUMX2/rIWVEsNB/utOMVkNDA5Cie8aWO8ZoZVJ5G05up2Ya5s1w91GQWYMEVa8e2JpEFgZap3hFKSHytoaFjuOHlTd5cmrOaspr5Mw0tpjhGNtTrYi+S1QvUsUwE2P0h172fS0grGYjUnClh60GnH1Ppb75RI3h2MSASrBvE1BmrS
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4280.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(396003)(136003)(346002)(39860400002)(66556008)(66946007)(76116006)(4326008)(19627405001)(64756008)(66446008)(478600001)(66476007)(9686003)(8676002)(186003)(83380400001)(52536014)(33656002)(53546011)(26005)(8936002)(6506007)(7696005)(41300700001)(38070700005)(55016003)(71200400001)(122000001)(5660300002)(6916009)(2906002)(38100700002)(91956017)(54906003)(86362001)(316002);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_AM6PR08MB4280FFAAFCB128C05A3059F7FB8C9AM6PR08MB4280eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2811
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	247578d4-0d62-463a-4871-08da68dfa508
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wz5KLpOzZ1eK6nD+QIRVb95/ihI3gzoxLRX4AEiMM9F+fsJ0G3l6nCq3avFR0FSHZxnLMWRApN0PUUpCovQWHTU/v7rV3ActL5Z2lWPhFUQu/iFRwJmXLHJpOAxCPNlXEtRudelfJVRzc07m2BqLMdXIaEnT2kCfh9/lopzWzMOrJGmbWMJUJtPBMHEJWQjZDgJ10u0LWifk6U0LH9p60wq6DRC2I6ZmwlEPbZSroHT4ePVVMZbzUBoHqzoYQmocJyRjXQKRbe4Gqgcbc3mTNaktqWV9r3x5WVWtzqoesQX7RUAH6XvLDaD4CrzfvY1W/+fll5y6yA8p2b3TGQgJp2fyPtLtb/JhmqXfcMe5LfZM8iEvw0AdVCxC3CWW214bJzP8TJ6r9ru/p2lltu6XD+4GP1viNBhMmxieyl7WSCj71MS5LXX2PjVY8OL6RafDUJLFW5A5ULXp6Mq9e5wexzqVM2xeRyKLRaeEsKl94VePyVptGFXMJoOCjtzJL4yR/Fz5DJh/mRqnx6/V2y9GV8zY8YX/VjECcU8rCIy8onvoX7UboLmOBJx2U+VbTGEzhzWngh9ONxK0WNEOiWW7OE75ga+59M3IzDKJqjOiLHDUOfNSAf3cmfLbUAQ1cux7RxIKL5xWfEtfmvzqt4BjPDXBtb4/b5KynxGnY8A8NKjr0tGB1rY00MsgJzimmNO6oNnH7koO3Zz/JeQJsNaC75gYIWD0mv5D95pWg7FNawTJXeIt6TFJwyJ+tAVgnGU37ygiV4P6HB9BegdEQm8E/1Fsxn9elaIBF0pozTxycrRr529hbidHz0zD9AyDqsqW
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(376002)(396003)(39860400002)(46966006)(40470700004)(36840700001)(7696005)(6506007)(53546011)(41300700001)(40480700001)(83380400001)(186003)(478600001)(336012)(47076005)(26005)(6862004)(5660300002)(82310400005)(40460700003)(9686003)(55016003)(36860700001)(316002)(86362001)(54906003)(52536014)(8676002)(4326008)(70206006)(70586007)(19627405001)(33656002)(8936002)(81166007)(82740400003)(356005)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 17:05:12.1173
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 813d9bb6-9fe4-42a2-e6d1-08da68dfad5d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4981
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 18 Jul 2022 17:05:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3566

--_000_AM6PR08MB4280FFAAFCB128C05A3059F7FB8C9AM6PR08MB4280eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks as ever.

And noted - I'll send a second email in future.

Peter
________________________________
From: Jon Mason <jdmason@kudzu.us>
Sent: 18 July 2022 18:00
To: Peter Hoyes <Peter.Hoyes@arm.com>
Cc: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>; Dieg=
o Sueiro <Diego.Sueiro@arm.com>
Subject: Re: [PATCH] arm/lib: Improve FVPRunner shutdown logic

On Mon, Jul 18, 2022 at 01:15:33PM +0100, Peter Hoyes wrote:
> From: Peter Hoyes <Peter.Hoyes@arm.com>
>
> Please can this be applied to master + kirkstone.

Applying to both master and kirkstone.

In the future, please add requests like this in the patch after the ---
Otherwise, it will get pulled into the commit message, and I have to
edit it out by hand.  Alternatively, you can send a second email with
"kirkstone" in the subject line after "PATCH" (and my scripts will
automatically pull it in).  Finally, you can just respond to the
initial email with a "and kirkstone too" and I'll do it manually then.

Thanks,
Jon

>
> We have encountered intermittent hanging during FVP shutdown, so improve
> the termination logic by first issuing a terminate(), waiting a bit
> then, if necessary, issuing a kill().
>
> Move returncode logic to after the telnet/pexpect cleanup so it
> actually runs.
>
> Move pexpect.EOF logic into FVPRunner.stop so that it executes before
> closing the pexpect handle.
>
> Issue-Id: SCM-4957
> Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
> Change-Id: Iebb3c3c89367256b1e116e66ffdb6b742358bce4
> ---
>  meta-arm/lib/fvp/runner.py           | 34 +++++++++++++++++++---------
>  meta-arm/lib/oeqa/controllers/fvp.py |  6 -----
>  2 files changed, 23 insertions(+), 17 deletions(-)
>
> diff --git a/meta-arm/lib/fvp/runner.py b/meta-arm/lib/fvp/runner.py
> index 3b3fd00..7641cd6 100644
> --- a/meta-arm/lib/fvp/runner.py
> +++ b/meta-arm/lib/fvp/runner.py
> @@ -72,24 +72,36 @@ class FVPRunner:
>
>      async def stop(self):
>          if self._fvp_process:
> -            self._logger.debug(f"Killing FVP PID {self._fvp_process.pid}=
")
> +            self._logger.debug(f"Terminating FVP PID {self._fvp_process.=
pid}")
>              try:
>                  self._fvp_process.terminate()
> +                await asyncio.wait_for(self._fvp_process.wait(), 10.0)
> +            except asyncio.TimeoutError:
> +                self._logger.debug(f"Killing FVP PID {self._fvp_process.=
pid}")
> +                self._fvp_process.kill()
>              except ProcessLookupError:
>                  pass
>
> -            if await self._fvp_process.wait() !=3D 0:
> -                self._logger.info(f"FVP quit with code {self._fvp_proces=
s.returncode}")
> -                return self._fvp_process.returncode
> -            else:
> -                return 0
> -
>          for telnet in self._telnets:
> -            await telnet.terminate()
> -            await telnet.wait()
> +            try:
> +                telnet.terminate()
> +                await asyncio.wait_for(telnet.wait(), 10.0)
> +            except asyncio.TimeoutError:
> +                telnet.kill()
> +            except ProcessLookupError:
> +                pass
> +
> +        for console in self._pexpects:
> +            import pexpect
> +            # Ensure pexpect logs all remaining output to the logfile
> +            console.expect(pexpect.EOF, timeout=3D5.0)
> +            console.close()
>
> -        for pexpect in self._pexpects:
> -            pexpect.close()
> +        if self._fvp_process and self._fvp_process.returncode:
> +            self._logger.info(f"FVP quit with code {self._fvp_process.re=
turncode}")
> +            return self._fvp_process.returncode
> +        else:
> +            return 0
>
>      async def run(self, until=3DNone):
>          if until and until():
> diff --git a/meta-arm/lib/oeqa/controllers/fvp.py b/meta-arm/lib/oeqa/con=
trollers/fvp.py
> index 30b6296..c8dcf29 100644
> --- a/meta-arm/lib/oeqa/controllers/fvp.py
> +++ b/meta-arm/lib/oeqa/controllers/fvp.py
> @@ -127,12 +127,6 @@ class OEFVPSerialTarget(OEFVPSSHTarget):
>                  default_test_file =3D f"{name}_log{self.test_log_suffix}=
"
>                  os.symlink(default_test_file, self.bootlog)
>
> -    async def _after_stop(self):
> -        # Ensure pexpect logs all remaining output to the logfile
> -        for terminal in self.terminals.values():
> -            terminal.expect(pexpect.EOF, timeout=3D5)
> -            terminal.close()
> -
>      def _get_terminal(self, name):
>          return self.terminals[name]
>
> --
> 2.25.1
>
>

--_000_AM6PR08MB4280FFAAFCB128C05A3059F7FB8C9AM6PR08MB4280eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Thanks as ever.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
And noted - I'll send a second email in future.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Peter</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Jon Mason &lt;jdmason=
@kudzu.us&gt;<br>
<b>Sent:</b> 18 July 2022 18:00<br>
<b>To:</b> Peter Hoyes &lt;Peter.Hoyes@arm.com&gt;<br>
<b>Cc:</b> meta-arm@lists.yoctoproject.org &lt;meta-arm@lists.yoctoproject.=
org&gt;; Diego Sueiro &lt;Diego.Sueiro@arm.com&gt;<br>
<b>Subject:</b> Re: [PATCH] arm/lib: Improve FVPRunner shutdown logic</font=
>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Mon, Jul 18, 2022 at 01:15:33PM +0100, Peter Ho=
yes wrote:<br>
&gt; From: Peter Hoyes &lt;Peter.Hoyes@arm.com&gt;<br>
&gt; <br>
&gt; Please can this be applied to master + kirkstone.<br>
<br>
Applying to both master and kirkstone.<br>
<br>
In the future, please add requests like this in the patch after the ---<br>
Otherwise, it will get pulled into the commit message, and I have to<br>
edit it out by hand.&nbsp; Alternatively, you can send a second email with<=
br>
&quot;kirkstone&quot; in the subject line after &quot;PATCH&quot; (and my s=
cripts will<br>
automatically pull it in).&nbsp; Finally, you can just respond to the<br>
initial email with a &quot;and kirkstone too&quot; and I'll do it manually =
then.<br>
<br>
Thanks,<br>
Jon<br>
<br>
&gt; <br>
&gt; We have encountered intermittent hanging during FVP shutdown, so impro=
ve<br>
&gt; the termination logic by first issuing a terminate(), waiting a bit<br=
>
&gt; then, if necessary, issuing a kill().<br>
&gt; <br>
&gt; Move returncode logic to after the telnet/pexpect cleanup so it<br>
&gt; actually runs.<br>
&gt; <br>
&gt; Move pexpect.EOF logic into FVPRunner.stop so that it executes before<=
br>
&gt; closing the pexpect handle.<br>
&gt; <br>
&gt; Issue-Id: SCM-4957<br>
&gt; Signed-off-by: Peter Hoyes &lt;Peter.Hoyes@arm.com&gt;<br>
&gt; Change-Id: Iebb3c3c89367256b1e116e66ffdb6b742358bce4<br>
&gt; ---<br>
&gt;&nbsp; meta-arm/lib/fvp/runner.py&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; | 34 +++++++++++++++++++---------<br>
&gt;&nbsp; meta-arm/lib/oeqa/controllers/fvp.py |&nbsp; 6 -----<br>
&gt;&nbsp; 2 files changed, 23 insertions(+), 17 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta-arm/lib/fvp/runner.py b/meta-arm/lib/fvp/runner.py<b=
r>
&gt; index 3b3fd00..7641cd6 100644<br>
&gt; --- a/meta-arm/lib/fvp/runner.py<br>
&gt; +++ b/meta-arm/lib/fvp/runner.py<br>
&gt; @@ -72,24 +72,36 @@ class FVPRunner:<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; async def stop(self):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if self._fvp_pro=
cess:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; se=
lf._logger.debug(f&quot;Killing FVP PID {self._fvp_process.pid}&quot;)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; se=
lf._logger.debug(f&quot;Terminating FVP PID {self._fvp_process.pid}&quot;)<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; try:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self._fvp_process.terminate()<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; await asyncio.wait_for(self._fvp_process.wait(), 10.0=
)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ex=
cept asyncio.TimeoutError:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; self._logger.debug(f&quot;Killing FVP PID {self._fvp_=
process.pid}&quot;)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; self._fvp_process.kill()<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; except ProcessLookupError:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pass<br>
&gt;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if=
 await self._fvp_process.wait() !=3D 0:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; self._logger.info(f&quot;FVP quit with code {self._fv=
p_process.returncode}&quot;)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return self._fvp_process.returncode<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; el=
se:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return 0<br>
&gt; -<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for telnet in se=
lf._telnets:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; aw=
ait telnet.terminate()<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; aw=
ait telnet.wait()<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tr=
y:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; telnet.terminate()<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; await asyncio.wait_for(telnet.wait(), 10.0)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ex=
cept asyncio.TimeoutError:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; telnet.kill()<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ex=
cept ProcessLookupError:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; pass<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for console in self._pexpe=
cts:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; im=
port pexpect<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # =
Ensure pexpect logs all remaining output to the logfile<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; co=
nsole.expect(pexpect.EOF, timeout=3D5.0)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; co=
nsole.close()<br>
&gt;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for pexpect in self._pexpe=
cts:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pe=
xpect.close()<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if self._fvp_process and s=
elf._fvp_process.returncode:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; se=
lf._logger.info(f&quot;FVP quit with code {self._fvp_process.returncode}&qu=
ot;)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; re=
turn self._fvp_process.returncode<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; re=
turn 0<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; async def run(self, until=3DNone):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if until and unt=
il():<br>
&gt; diff --git a/meta-arm/lib/oeqa/controllers/fvp.py b/meta-arm/lib/oeqa/=
controllers/fvp.py<br>
&gt; index 30b6296..c8dcf29 100644<br>
&gt; --- a/meta-arm/lib/oeqa/controllers/fvp.py<br>
&gt; +++ b/meta-arm/lib/oeqa/controllers/fvp.py<br>
&gt; @@ -127,12 +127,6 @@ class OEFVPSerialTarget(OEFVPSSHTarget):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default_test_file =3D f&quot;{name}_log{sel=
f.test_log_suffix}&quot;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; os.symlink(default_test_file, self.bootlog)=
<br>
&gt;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp; async def _after_stop(self):<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Ensure pexpect logs all =
remaining output to the logfile<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for terminal in self.termi=
nals.values():<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; te=
rminal.expect(pexpect.EOF, timeout=3D5)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; te=
rminal.close()<br>
&gt; -<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; def _get_terminal(self, name):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return self.term=
inals[name]<br>
&gt;&nbsp; <br>
&gt; -- <br>
&gt; 2.25.1<br>
&gt; <br>
&gt; <br>
</div>
</span></font></div>
</body>
</html>

--_000_AM6PR08MB4280FFAAFCB128C05A3059F7FB8C9AM6PR08MB4280eurp_--

