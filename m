Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.79])
 by mx.groups.io with SMTP id smtpd.web10.10672.1595505675926504853
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Jul 2020 05:01:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=JGxC7bSQ;
 spf=pass (domain: arm.com, ip: 40.107.6.79, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qetwAtT8GfKH+h0Tjysv1T6/xDTMurc7MIyR1NCS7KM=;
 b=JGxC7bSQScloJ7jrWVbBN1uwRr1xQvH7slyaAb/8CVFwHHf4ePdGxywkkWIXkJx+t2VdLuzORgiuo4BkPEiPk/pdreYyszbpF2KvSu3cVsNfB+mYNx6ieUHapW0g8rJTb1hjKGiNj2tQPdWpoa1kkf+rUfdHDoQTtC5hpSEwU+s=
Received: from AM6P191CA0077.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::18)
 by DB8PR08MB5404.eurprd08.prod.outlook.com (2603:10a6:10:117::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Thu, 23 Jul
 2020 12:01:13 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8a:cafe::82) by AM6P191CA0077.outlook.office365.com
 (2603:10a6:209:8a::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21 via Frontend
 Transport; Thu, 23 Jul 2020 12:01:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT034.mail.protection.outlook.com (10.152.18.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.10 via Frontend Transport; Thu, 23 Jul 2020 12:01:13 +0000
Received: ("Tessian outbound 1c27ecaec3d6:v62"); Thu, 23 Jul 2020 12:01:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: de085c2c7bb7862c
X-CR-MTA-TID: 64aa7808
Received: from d1b15932b702.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2E25EB45-3367-4FBD-98F2-DA3F011CDE25.1;
	Thu, 23 Jul 2020 12:01:07 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d1b15932b702.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 23 Jul 2020 12:01:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eMNQVcZuas/fXmqeNsPuS8ivdgfpmd+5zqTeVz8mxiQnIlUjxgtlvIYBWAf1rpuxNxLUmSDE3Jmc2jT8p98mUm/WWDmJhKfskJnr9pCfcSo8FNV76SGFoOlwMPqaMQcXPQSKwRo9p3qjIWBS25123RFQH0aDZ8GA3R3M7aF0ZC11Z6c7WuKeyzmiGSb69NFNqXaVQBQOREo57if+SJTQyyAH1dE/+8BH4htwpnHB6/Xx90dHuF26MCfyIgAbkQvLsp/LkCSiZNZPtHGJokFLWZEIUYyfF7n1gt0sFF7Bp+cTNpoz9wwmocPhb0m0TgcczQkDRkFMvo1x04Db81oQmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qetwAtT8GfKH+h0Tjysv1T6/xDTMurc7MIyR1NCS7KM=;
 b=UAewUYhBl8hHz20MDGKpKXLv7VXzEpB/fNKyF33XVb8UAnAgiThfBXUHXkDdl7htXvan/gmbeJdnWHlr1U+Ve4x5A1J2w98lC0jgc5bqFb8Md9CweqR5sxwqSvAw72GOxY+4DV3Olsn+KeuHOX4om9pTfzibFA07llJvkoTdlHJIdaB1/UTwEpwqxWlyuAr9FxiXJDj86yslVfR4akT6pTBXI+MYqNrSFGVCqN/k6ZxPm1EqBo2b84yfyeixyzt2Jngz3EGl1/2abOCcTgUve+iqN6Bo8waepg7vdLAgcJZiRU0Lei5Nm6Ko2BLiTz4LlP618YOPX59mWsEkhJcGGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qetwAtT8GfKH+h0Tjysv1T6/xDTMurc7MIyR1NCS7KM=;
 b=JGxC7bSQScloJ7jrWVbBN1uwRr1xQvH7slyaAb/8CVFwHHf4ePdGxywkkWIXkJx+t2VdLuzORgiuo4BkPEiPk/pdreYyszbpF2KvSu3cVsNfB+mYNx6ieUHapW0g8rJTb1hjKGiNj2tQPdWpoa1kkf+rUfdHDoQTtC5hpSEwU+s=
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18)
 by DB8PR08MB3961.eurprd08.prod.outlook.com (2603:10a6:10:ad::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Thu, 23 Jul
 2020 12:01:05 +0000
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::756a:e5c9:72e0:c023]) by DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::756a:e5c9:72e0:c023%4]) with mapi id 15.20.3216.024; Thu, 23 Jul 2020
 12:01:05 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, nd
	<nd@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-bsp/wic: fix WKS dependencies for N1SDP components
Thread-Topic: [meta-arm] [PATCH] arm-bsp/wic: fix WKS dependencies for N1SDP
 components
Thread-Index: AQHWYOTRxhYfVXWNw0qc8+SYW/sRkqkVCTuAgAAGxAs=
Date: Thu, 23 Jul 2020 12:01:05 +0000
Message-ID: 
 <DB8PR08MB496907896286CDB0C0A361D6FA760@DB8PR08MB4969.eurprd08.prod.outlook.com>
References: 
 <20200723113115.22309-1-khasim.mohammed@arm.com>,<CAP71Wjz45ONFZ6PiUadG33Y2Fp3JfJLzED8LY4hjm32GvfrDEw@mail.gmail.com>
In-Reply-To: 
 <CAP71Wjz45ONFZ6PiUadG33Y2Fp3JfJLzED8LY4hjm32GvfrDEw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 19e553f3-4958-4b03-dbf7-08d82f00189f
x-ms-traffictypediagnostic: DB8PR08MB3961:|DB8PR08MB5404:
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB54046F367C0287C9048E776EFA760@DB8PR08MB5404.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4502;OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 0Capl/Xv1hjP7CQTPy1Vydpj11whos5YkhFe8jPeuxExZNZZDZHhU/q2Xrr36yxHBmaOcOjU5ppnfTduTGPm5aO5J3hKjLY2J9JPOykwjuE5fzlH7G4CkUedATm1UmdokH8Y6ztxHp4LIqlxm5CWG8n1R2q1dGQSztTrelYLmrX4egit74bFtSNA/sj7lPUImRACZDVR4WALXxk9iSg9epEL96e/EwhU0YAHN6ilGjI8fdthfZ4fLCxsmrHdAhy9ErTgpTsHQpm3YdwuuVjYzeDDn9SGv30hchte+xqHGVlK0dZjvbKAZF6DE54hFTWFfJDS74Q3Mtq6HcWwaiSFxYA/tnnSNmvtoWaVHNzfb6l2KvgpbBdfFnyCgWqSaI2ZJiFOcKJqKQXogjESnN9aZz8kubORB68bKx5JALVwfXe7pACKd9CFsaWur4tsc7WnTzByDSs5IGAs3ur+DYl5TQctMV0EplW2VJCzvEgiEcM=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(346002)(396003)(39860400002)(366004)(376002)(71200400001)(966005)(26005)(4326008)(86362001)(53546011)(478600001)(186003)(316002)(6506007)(6916009)(55016002)(9686003)(83380400001)(8936002)(52536014)(66946007)(76116006)(2906002)(7696005)(54906003)(66446008)(64756008)(66556008)(66476007)(8676002)(5660300002)(33656002)(586874002)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 oRQIT5c5QwyPi1nExaP8Eycv7JgasEtrV+ZO7MsChnR7ZcIrxqBYDetHni7/IjYZjh+Pz/b9RlrW9NkqYCTHhZNnFx45Pc5rCjBJu+bj/+6M5LMsCYD8vsfxCicV4w79IlH3Zqy1Hoqw8yYF+hpdbMgL1nviY3HGR7kcU9jk8/ZhnExKHRXAX9pG4w5HHvXqPSi251HZ90QVMHLdHq5mXyreNzQbmdHyvAnwK3jCOWCcBnQCyOJdY+aPrm8Ku1M5xL3+KqB6jLXbC46etD1YPhJMw1aR3M7eQf3H7Xx+A5GrxHCahdurjABwyB6NO/xFvP8eYslWYE7ggaP4++BInsM8OUVS+4N8zKw+97i3STTTuqT3xiBQpYtDhPSqzdS/LyOfUVirml0sf6+vdXukglofs+a6GFxbFvC5TCAYlKHzbhtsPqI2QB9Jy3AaksvqipW5jAMI7MszqOoL5hiZj747fyu2dvLuW3D0b5miihOTJD242OFqaP+lkiY8qmRb
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3961
Original-Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c7ada870-30c2-44d0-0a7b-08d82f0013fa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aX+KEEOtL/Zq4FxiPkinlr9OdZcgqhtxozTi24m0XZoMb8fvceeGeFTDQvn0ljHHPAHmSzli9KKLM87yA8LdcTI/eoNtMioA2sn6eyYMlbmN7k68TlzFNOkMUwd12mhxFSfkv+ZPiwqYsXEOhb9Livfak20h2RpqwnRodXlSHRvp2xHMbTmg/Ey3m0uN4RnFdaWsJYCuRcBdPI6b0mOA69002p792ey4K3ON51kYZ0qNQsdKpE7mGFZlsXwkZuqe/YOPrTtEd59Y5K0Biso/P6jF4XgHRnltj0BoVz+fB66d5IEjJm5q4O3SHAJ4v7Wf0iw/fcRFvZFCje2ElMJHorHcVMCzs9Fo96oyyosBQfEIwA/E4CqlWhgAiMbTuSZkWRxp+JcUrEhjfqDIFFrB5yAnKHY5JcVEZK9kpca/9ciRlHBYcVPHxnyxfM1i9/Lljq5Bu3201eqxBJjT+P6UgOUbHLwc13FhCCw9MDWa6xOfxccx5Uyd650i2pCE8Bv8HuOTrLxHqJUm+gZ1k0IXqQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(39860400002)(376002)(346002)(396003)(46966005)(82740400003)(186003)(26005)(8676002)(82310400002)(86362001)(33656002)(478600001)(2906002)(356005)(8936002)(316002)(83380400001)(47076004)(7696005)(70206006)(36906005)(70586007)(336012)(9686003)(55016002)(6506007)(53546011)(54906003)(52536014)(5660300002)(966005)(81166007)(6862004)(4326008)(586874002)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2020 12:01:13.1420
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19e553f3-4958-4b03-dbf7-08d82f00189f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5404
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



________________________________________
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Sent: Thursday, July 23, 2020 5:06 PM
To: Khasim Mohammed
Cc: meta-arm@lists.yoctoproject.org; nd
Subject: Re: [meta-arm] [PATCH] arm-bsp/wic: fix WKS dependencies for N1SD=
P components

On Thu, Jul 23, 2020 at 1:31 PM Khasim Mohammed <khasim.mohammed@arm.com> =
wrote:
>
> Add build-time dependencies to ensure the required components
> (TFA, SCP, UEFI EDK2) are built and available before
> the task to create wic image gets initiated.
>
> Change-Id: I3789c8d1a44984a26d31ddd8ddd5d16f4d58c7d3
> Issue-Id: PLATFORMS-3134
> Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> ---
>  meta-arm-bsp/conf/machine/n1sdp.conf | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/ma=
chine/n1sdp.conf
> index 139f619..7925969 100644
> --- a/meta-arm-bsp/conf/machine/n1sdp.conf
> +++ b/meta-arm-bsp/conf/machine/n1sdp.conf
> @@ -17,6 +17,7 @@ SERIAL_CONSOLES =3D "115200;ttyAMA0"
>
>  # Set default WKS
>  WKS_FILE ?=3D "${@bb.utils.contains("EFI_PROVIDER", "systemd-boot", "sy=
stemd-bootdisk.wks", "mkefidisk.wks", d)}"
> +WKS_FILE_DEPENDS_append =3D "${EXTRA_IMAGEDEPENDS}"

> with _append you need an extra leading space.
Corrected - thanks Nico.

>
>  # Use kernel provided by linaro (Contains support for SCMi or HDMI)
>  PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-linaro-arm"
> --
> 2.17.1
>
>=20
