Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.51])
 by mx.groups.io with SMTP id smtpd.web12.14394.1585323003151383324
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Mar 2020 08:30:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=bQCOQkEP;
 spf=pass (domain: arm.com, ip: 40.107.13.51, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FVUsvwFqwysSi480j1GB+JdQAHJKzJq6F281RgniO4c=;
 b=bQCOQkEPjVr9bh4wi8Jy7Gb357b+3Foc3yIa4yRhlYUxHPoAPc1HKu9ucImB1gUCve6nJN1eYkIg4WVfeSIyOOYY9gxm4f4WHA9UFnneqwMd7oXT1o86vQ8aorE2EaUMRkfhSXxqs81IU03bUbGpK9WGWXqbRePDMDYGF+qQCHw=
Received: from DB6P193CA0004.EURP193.PROD.OUTLOOK.COM (2603:10a6:6:29::14) by
 AM0PR08MB3473.eurprd08.prod.outlook.com (2603:10a6:208:de::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.22; Fri, 27 Mar 2020 15:29:58 +0000
Received: from DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:29:cafe::70) by DB6P193CA0004.outlook.office365.com
 (2603:10a6:6:29::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19 via Frontend
 Transport; Fri, 27 Mar 2020 15:29:58 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT023.mail.protection.outlook.com (10.152.20.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Fri, 27 Mar 2020 15:29:58 +0000
Received: ("Tessian outbound 8f06d475fc37:v48"); Fri, 27 Mar 2020 15:29:58 +0000
X-CR-MTA-TID: 64aa7808
Received: from c4b8678a6c9f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 22946D2B-512E-4764-A861-05F177D0A6F8.1;
	Fri, 27 Mar 2020 15:29:53 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c4b8678a6c9f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 27 Mar 2020 15:29:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qkr/cIrUnWZG2eUa8P1B2/uvkcMTZst2DSHFsXlhLnml3P3itgwAdVGqZx8Qe7oGIns4Ltvp3SrSLye0y76gUM97Ht24QczCN4jncPCCgjlQBwI8cOcePf0X4exTgPRnCDf9RmjKWS9/J9soOhNfm9sl9n1q1kVtoySu7tiiLiQuLJPBJEEb9wXOS5D0+oPVVT2PWwbfVqMVm43+6G0iHg+y2xJhdBl8GskgONo9h4TF/wXwhtNIx+CsNBopTaMC6JMdQGzMvtzU65lWSBnIs3FpMfud5/VcGaUvo9tPLL73ZfyHFe6EQupu9xgug4w+WeNQrJ3P1BnGRzUARRqkxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FVUsvwFqwysSi480j1GB+JdQAHJKzJq6F281RgniO4c=;
 b=kkb6uyEaB7X9fPMoUZ7DltulrPlIi9GGF7zQjibbw7R0wSx0qJNOByYPw5gosNyod1D0AYHNJXvRmhYs/NwRtQNKMz3BiyJ5W67M5AUUBIFgTb/IZHrQJs8xe6UEMLGCHAHQWehhQbr6wFBA+TAUun1RTxiVOd7Rh/u+2bAUD4LssWFkpUwGa37yYlWkVYHotd8s9TkwhuGjlqhk6s4LKnbsDDNQsnjWvTeNuUnkxC/3x4rQjY+hCS3Kff0D3vUBHvefz3ATWaA7ygme6sSRYaFpNLvNk/MBF/Z4xzoaJSBaobhvE+Rv7jQmaQCxVV/siBYmvbGplzG33X5NJz4yxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FVUsvwFqwysSi480j1GB+JdQAHJKzJq6F281RgniO4c=;
 b=bQCOQkEPjVr9bh4wi8Jy7Gb357b+3Foc3yIa4yRhlYUxHPoAPc1HKu9ucImB1gUCve6nJN1eYkIg4WVfeSIyOOYY9gxm4f4WHA9UFnneqwMd7oXT1o86vQ8aorE2EaUMRkfhSXxqs81IU03bUbGpK9WGWXqbRePDMDYGF+qQCHw=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (20.178.203.79) by
 AM0PR08MB5393.eurprd08.prod.outlook.com (52.132.215.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.19; Fri, 27 Mar 2020 15:29:53 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791%3]) with mapi id 15.20.2856.019; Fri, 27 Mar 2020
 15:29:53 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 1/2] arm-autonomy: Add subdirectory config to ifupdown
Thread-Topic: [meta-arm] [PATCH 1/2] arm-autonomy: Add subdirectory config to
 ifupdown
Thread-Index: AQHWBCYZREngqrmnVEGblkUNIR2Om6hckLow
Date: Fri, 27 Mar 2020 15:29:52 +0000
Message-ID: 
 <AM0PR08MB3987B91821A0C90DD154BE6692CC0@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <20200327105358.507-1-bertrand.marquis@arm.com>
 <20200327105358.507-2-bertrand.marquis@arm.com>
In-Reply-To: <20200327105358.507-2-bertrand.marquis@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: a907bf97-088b-42d1-ac91-a07657ad2e71.0
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
x-originating-ip: [5.68.4.242]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 277ed9ce-ce4a-478a-b313-08d7d263b5b2
x-ms-traffictypediagnostic: AM0PR08MB5393:|AM0PR08MB3473:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB3473B1046208D0F28867B5A592CC0@AM0PR08MB3473.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:6790;
x-forefront-prvs: 0355F3A3AE
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(376002)(366004)(346002)(39860400002)(396003)(136003)(66946007)(66476007)(55016002)(81166006)(52536014)(64756008)(9686003)(5660300002)(8676002)(2906002)(7696005)(66556008)(478600001)(81156014)(76116006)(26005)(55236004)(6916009)(66446008)(8936002)(4326008)(86362001)(186003)(71200400001)(316002)(33656002)(6506007)(53546011);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 MaIwEam/EXTrj688zjI09xyLTZDC7rg8I0jk901AX9ZhnR1NtWqs79qLC21NIqnipAA+23SwZG4dWn1xMG+BMnX6zwfK3TzyJkPTKlE9mEMmgp1j4ItEpGyiDloWWHEtMC+Maij1ldyq962gaf4eSd8NcETbfHZW9cD+i8/IuD1AQBJJq3ZosC551vX0vlHIsabHw7PAKE66ikajWvFaKS75hEWZWeEhHhYHCfBm5h0fbruAI0ahlcVIIJUyLMI01w2aCgQ6Z/cdfC+lN2/RuQfiL9MjTRSncxDD+VxZrejRKp0WsljDyg48oxwpbpJF8uPG5FkwCUMPFwiiZP6kF1o9oXRcK0ulumTZaq7aawTV13jENz/b6Qc2xW40RDsClakaPGNCBXy0ao6MVaJEXiArLc6IIukKOBD//89G9pOLIr8/d5LcSVvj40n90Eeb
x-ms-exchange-antispam-messagedata: 
 xDbg60o6flULujdFB7aSk4h98p+h4UZ6JNLA/iIpWGFh1kUre5z4Xtf9t1EbfC/FJJ6qHVWuGEoBNUSBeBvcyRPLtvCz5/0PS4+eGj3kVVUjc68erV6TSaClYc6M7OFTOEJNaxuBGMLtDHGAv+4xcA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5393
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(136003)(39860400002)(396003)(346002)(376002)(46966005)(33656002)(26005)(336012)(4326008)(2906002)(82740400003)(70206006)(70586007)(6506007)(52536014)(5660300002)(53546011)(47076004)(81166006)(55016002)(8676002)(81156014)(186003)(7696005)(26826003)(86362001)(8936002)(356004)(9686003)(478600001)(316002)(6916009);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	48f81481-ddf9-4d2d-af89-08d7d263b249
X-Forefront-PRVS: 0355F3A3AE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8OWvV7RkzB9f3WylmxXABch/LVpre8Wxg86OxKl493VhKCjlrZNNo9fE3FztrRNbVFZ+jDUAKnK7Qmm777Nq2PeWWD8L6ajzD8J/T6opI0/rw/GyujUzYLwHBKeNbOBlFakyrfn1sUbHXU6MmnP21sya9/aIjxAAmdUI/YCtV66VTRwpORe24MYP0L6MIeKDT7Bl3iUlW+D+6Xg/nsLRKVwulCchVa0CcWVZauA1cF01P7E+tdhr2xa/we+HlECex7ZI/Suyci8Hr722CJ2YZp+viS4yqtJ6AkWKnfwwKhIFvOVPM89ST87dydshgm51OkQ7EyvvhM68jX/PdOsfewu6fGmefbOl4sOxS933lK7UKAF5h+ebP/aB5V5Y6qnBU5/AMd2bpBAPJNdf69EQHaywoVXhSu6zWkEOLr6dU+9AFVagw9h9sP/bQu8ENokgwHz2cIl9hvOKZhXWhIV/KESGZcre5gHRub+pMvHYDMiEpBrLaa5mdU0tm5y6XWKAvS57RlhhCE7gqWnxywwHBw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2020 15:29:58.8127
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 277ed9ce-ce4a-478a-b313-08d7d263b5b2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3473
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> On Behalf Of Bertrand Marquis via Lists.Yoctoproject.Org
> Sent: 27 March 2020 10:54
> To: meta-arm@lists.yoctoproject.org
> Cc: nd <nd@arm.com>
> Subject: [meta-arm] [PATCH 1/2] arm-autonomy: Add subdirectory config to
> ifupdown
>=20
> Modify default interfaces file for network to scan sub-directory interfac=
es.d to
> let other recipes contribute to the network configuration file
>=20
> Change-Id: I72cf7fd8ccb51e3cdfdafc368adb4574393fdc08
> Issue-Id: SCM-767
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  .../init-ifupdown/init-ifupdown_1.0.bbappend   | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-arm-autonomy/recipes-core/init-ifupdown/init-
> ifupdown_1.0.bbappend
>=20
> diff --git a/meta-arm-autonomy/recipes-core/init-ifupdown/init-
> ifupdown_1.0.bbappend b/meta-arm-autonomy/recipes-core/init-
> ifupdown/init-ifupdown_1.0.bbappend
> new file mode 100644
> index 0000000..2181210
> --- /dev/null
> +++ b/meta-arm-autonomy/recipes-core/init-ifupdown/init-ifupdown_1.0.bba
> +++ ppend
> @@ -0,0 +1,18 @@
> +# Add support for interface configuration via interfaces.d directory.
> +This # feature can be used by other packages to add network interface #
> +configuration by adding network network interface configuration file
> +under # interfaces.d directory.
> +
> +do_install_append() {
> +    # Add scan of interfaces.d to interfaces file
> +    cp -f ${WORKDIR}/interfaces ${WORKDIR}/interfaces.subdir
> +    echo "source-directory ${sysconfdir}/network/interfaces.d/"
> +        >> ${WORKDIR}/interfaces.subdir
> +
> +    # Create interfaces.d script in case nobody is adding a script
> +    # so that there is no error about non existing directory
> +    install -d -m 755 ${D}${sysconfdir}/network/interfaces.d
> +
> +    # Install our file instead of the original one
> +    install -m 644 interfaces.subdir
> +${D}${sysconfdir}/network/interfaces
> +}
> --
> 2.17.1

