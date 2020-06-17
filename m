Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.81])
 by mx.groups.io with SMTP id smtpd.web12.2767.1592381031316463240
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Jun 2020 01:03:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=tDlUa/Fz;
 spf=pass (domain: arm.com, ip: 40.107.14.81, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TXyyvpKWC7ip41kF6hb+R7JIhqVkCthYfYBBvNCJSIs=;
 b=tDlUa/Fz8Pvdw1nqIzw1LFyAY6dGIjZmSkLhlH849GEAXKq9lCI3/8zxqEuQvp3CSWODcaYf03jX+rJ0C7t5lpenfVtebwj5nMFBZMw0SzXkNwps9fWsh45K7dOnfjolMHbFzEf8ivn7dvKaBS36FjC48VlAmsYnmY/NIcNsXms=
Received: from AM6P193CA0140.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::45)
 by DB6PR0801MB2040.eurprd08.prod.outlook.com (2603:10a6:4:75::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Wed, 17 Jun
 2020 08:03:48 +0000
Received: from AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:85:cafe::d8) by AM6P193CA0140.outlook.office365.com
 (2603:10a6:209:85::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Wed, 17 Jun 2020 08:03:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT017.mail.protection.outlook.com (10.152.16.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22 via Frontend Transport; Wed, 17 Jun 2020 08:03:48 +0000
Received: ("Tessian outbound 09efa10eaf29:v59"); Wed, 17 Jun 2020 08:03:48 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a7e30a92613e6ac1
X-CR-MTA-TID: 64aa7808
Received: from a3e0970f64d9.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6AA3CB1B-9EB0-417A-817A-379DC222B00B.1;
	Wed, 17 Jun 2020 08:03:42 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a3e0970f64d9.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 17 Jun 2020 08:03:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CQ3tqVa5e8XJJAssWFcvivwiq+baBv+jB7h03zN97kS1E2F2mAuegB/olFFe5tIQtrSgniZMx2F1BklQaajF656iXJ00gCSqTbXtHWUh12+EtTzPmBnliIB7GpbLywSA0HmvchK+ELn5PCGdTfAADd/bcMW8K+w5zhVxM9K1HxW3eWly8c2F44nzFgWXhISbHUEGrRhDc4DbkPT9aVCdcGI4pH4ZY4I8JFBrrEZgtIzhUEPAam47hvQBiqIPxl0vYnrYefPFH3V62kC5lXBuduzu8BpomgecU0GdwrPW1h1SiZMeJQC6k2ssse/uCG1EXfP7yMKArlYOe+FkZkokRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TXyyvpKWC7ip41kF6hb+R7JIhqVkCthYfYBBvNCJSIs=;
 b=oHhBWnvuKTRs/qHjtFhrjLZjK0mbE323z35VZsNU80LHQ3hIJT23FmL6/dSYVPxXVLkUBxIderz6sHrmNke2qUXEYlKP/Ei1bcMrelTs645/OVUaokySvggJPE7wLz7oYxcEgl3rPcIUNlnQomtB8z7wpkTYIPwA4GMKyMPSuYdIZs7MsVW7xiPwcZo3jHKnVY89Khi5ASxOEJzJn9igVb+p1jf6zXN7R4Sqba67NjxgTZqY13OZLdAMOozzYIL890oRwr71qL3jlIBf7K/TsTcBt6dfFUblJIdM2tNVxWRvfkMZEYDSEbdq3XcBBMHmpDp1feuZyEwzeBJxy6yi5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TXyyvpKWC7ip41kF6hb+R7JIhqVkCthYfYBBvNCJSIs=;
 b=tDlUa/Fz8Pvdw1nqIzw1LFyAY6dGIjZmSkLhlH849GEAXKq9lCI3/8zxqEuQvp3CSWODcaYf03jX+rJ0C7t5lpenfVtebwj5nMFBZMw0SzXkNwps9fWsh45K7dOnfjolMHbFzEf8ivn7dvKaBS36FjC48VlAmsYnmY/NIcNsXms=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3162.eurprd08.prod.outlook.com (2603:10a6:5:23::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.22; Wed, 17 Jun
 2020 08:03:37 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3088.028; Wed, 17 Jun 2020
 08:03:37 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Diego Sueiro <Diego.Sueiro@arm.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, nd
	<nd@arm.com>
Subject: Re: [meta-arm] [PATCH 1/2] arm-autonomy, xenguest: Fail if Dom0 is not properly initialized
Thread-Topic: [meta-arm] [PATCH 1/2] arm-autonomy, xenguest: Fail if Dom0 is
 not properly initialized
Thread-Index: AQHWRGz3dI9gFc9QzECInHAm3BpBBKjccsAA
Date: Wed, 17 Jun 2020 08:03:37 +0000
Message-ID: <BAE788B9-A7F5-4AA9-A208-63A45A6FF565@arm.com>
References: <1592373744-85392-1-git-send-email-diego.sueiro@arm.com>
In-Reply-To: <1592373744-85392-1-git-send-email-diego.sueiro@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 928d97e6-2b4c-4a6f-0b7d-08d81294f72f
x-ms-traffictypediagnostic: DB7PR08MB3162:|DB6PR0801MB2040:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<DB6PR0801MB20401A7CE85C22D61A70900C9D9A0@DB6PR0801MB2040.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
x-forefront-prvs: 04371797A5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 FOyTOLSlRvU0FPXSCoRro6rcbx3xE96Y6edsrQVNf1SpcVHcpnJHZHUKsC3Ys7sI1IscO84sYXKcYATYuaPFk+yIS7J65XURP2ZL8Dz7cJcvuTmrpwmjYUwFOmXZGRMYD6n6oXPIZFW5AR9rqurjBovdmJNMKEBSwtv5DObh5yN+sY7fgDSKh1mA9H5Dfd4rHHKEU4V6zMnaZD4fon+NBjEGQSBVtUNFBW6wcyZsjSxbzOoMqoxwwq2V9lXnBnWmBtiCyyZZXyt2wFOiKRWWEeJ3BOhlv0zsmX58wqw6OXxGmu9pZTuMcdod/sDHcpu6SsI71yy96tLtF1OwUHxKVvh8wzT6WA3tz/RRtdowS9nPgOIKu0AFn8LflegSK7OSl0GktOfL0DHddLDxG9st9Q==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(346002)(376002)(39860400002)(366004)(136003)(6862004)(6486002)(8936002)(6636002)(91956017)(6506007)(86362001)(4326008)(316002)(2906002)(53546011)(83380400001)(76116006)(8676002)(36756003)(64756008)(66476007)(186003)(6512007)(26005)(71200400001)(2616005)(478600001)(33656002)(5660300002)(66946007)(54906003)(66556008)(66446008)(37006003)(966005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 lKWNm37RhaQ/cKAsEhdwiRp9uyJR0lOUuL80/fgR5Q02CpQNUKAWltwDJJPhVEZyhhhT67ZM37Ua1Q+Ibn4YToLumrEImmVO+5bvDPDCDok7GGegMVd+IGgZ8MJnAXh8Tyb01j9Naq76Acc6YWsmfv9+DKlHbVG+NMRLiqlXiZ7rlyDcdrdI4K7eJfZnm3a7rfV+G3Ey8O2dRzEJneJZ0RNyrdYfcTA2vCuFLmWDLi6B/p63MsgRxliIXiUOaO2rLqE9eBiasf2DTmQwO/gODDSJxHAFVS3DC5hsoNpND7anL70qkokzroOwEQa75ZDBW8KFZ3V7XFKWpkD1Gix9a0A3iyX0QJow8412TO5uxKnMggK3wetCTigyQC8wKgaGi+CQO+gjifbybTfrS1+n2ge7UhEHyIZ5P+FTUEt1GpvR4K8c4UE1a472kj0HIVTTgBvh++kS3nUb1OuD4CBm81T/5riAdn06fdwcNe6vcQxlpu6emoIFNp6rIjYCIcp+
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3162
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(136003)(396003)(39860400002)(346002)(46966005)(2616005)(26005)(82310400002)(6862004)(6636002)(83380400001)(478600001)(70206006)(5660300002)(82740400003)(4326008)(37006003)(2906002)(316002)(336012)(36906005)(54906003)(8936002)(81166007)(6512007)(6486002)(36756003)(53546011)(966005)(8676002)(70586007)(33656002)(47076004)(356005)(6506007)(186003)(86362001);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5ebc7cb5-8697-41de-bbed-08d81294f0d3
X-Forefront-PRVS: 04371797A5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+T1Lh8uUsr3LjMjb/QLE5x95SsRJEGNUavdgO39OKPtgRxgT1RlejLmPqGdFa1BeUT8YVr4JYnq4+kyAjlwAJE5N+MgcnhXJ84wfpb6Y3ky478QOdHQ5hwL3ag5piw0gWIQKOkdlm2MDtKjUvUfin+jNG2pwpiJJDhq/QJmNi9v2xqW1KExsO56rHk1xGaZviBc9yrQa+rTM04DqxQ0Pe82pQMQCY3Z0hku2kQK/m9UsggYv6146/x/JRoNSZe7E8zPSs61wAUexwIK8yRG9YTtKG+lwtvIwJoAdMVjYDnymS1pIR/uCFEWI3dpWbOFWowPWHzEP7WZw4jPOEuTPGsSJynNKlNA0H3GxrYcgAxN7mSEyuG2YBBMGxVKOw1R77nIZOXtL2Svjnsx0uiGErdDQcQSHLs0aDoAp7wJA3BuH3656jvu51ioa4C/lg5KqBotjSHChdRb/wX3kqwmKCK0+sd0EZmx+IXcBNBV+LYA=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2020 08:03:48.1001
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 928d97e6-2b4c-4a6f-0b7d-08d81294f72f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2040
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <742DC3FF93F9484BA6D1F1039EBB752E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable



> On 17 Jun 2020, at 07:02, Diego Sueiro via lists.yoctoproject.org <diego=
.sueiro=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> During the xenguest initialization and when invoking the
> xenguest-manager tool, abort the execution if Dom0 was not properly
> initialized on top of Xen and with the proper kernel configurations.
>=20
> Change-Id: I307c03e58a266a943968df1bc5ba39951912d2cb
> Issue-Id: SCM-996
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

> ---
> .../recipes-extended/xenguest/files/xenguest-init      |  3 +++
> .../recipes-extended/xenguest/files/xenguest-manager   | 18 ++++++++++++=
++++++
> 2 files changed, 21 insertions(+)
>=20
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-=
init b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
> index 9563d2f..cd249cf 100755
> --- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
> @@ -12,6 +12,9 @@ fi
>=20
> source ${XENGUEST_CONF_BASE}/xenguest-manager.conf
>=20
> +# Make sure we properly initialized the Dom0
> +/usr/bin/xenguest-manager check-xen || exit $?
> +
> # Create guest list
> guestlist=3D$(/usr/bin/xenguest-manager list)
>=20
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-=
manager b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manage=
r
> index 99975a2..6a10d35 100755
> --- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> @@ -566,6 +566,24 @@ case ${cmd} in
>         usage
>         exit 0
>         ;;
> +
> +esac
> +
> +# Check if we have a valid Dom0 booted with Xen
> +ERROR_MSG=3D$(xl info 2>&1)
> +if [ $? -ne 0 ]; then
> +    echo "ERROR: Xen environment is not valid!!!" | tee -a ${LOGFILE}
> +    echo "ERROR: Check if Xen has booted and the kernel configuration."=
 \
> +        | tee -a ${LOGFILE}
> +    echo "ERROR: Output from 'xl info' command:" | tee -a ${LOGFILE}
> +    echo "$ERROR_MSG" | tee -a ${LOGFILE}
> +    exit 1
> +fi
> +
> +case ${cmd} in
> +    check-xen)
> +        exit 0
> +        ;;
>     create)
>         guestfile=3D"${arg1}"
>         guestname=3D"${arg2}"
> --=20
> 2.7.4
>=20
>=20

