Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D228CF539D
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 14:54:42 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.11076.1729695274500931663
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Oct 2024 07:54:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=IAGRaLft;
 spf=pass (domain: linaro.org, ip: 209.85.208.169, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fc968b3545so20588751fa.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 23 Oct 2024 07:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729695273; x=1730300073; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l850wXjS4tHwENkmwaNxRgq9Jm5cPfUrAH7USoKxezo=;
        b=IAGRaLftOwd2d2X3Wz804TcqOUd670iDipBmMLE6XLJwz+sHb86QcO86MvAWy85YNX
         5DTTMeFBT7YiR+Dbw3kiKjI2l9d/oZxtQ6Fkuk2UAsQSRPk1pIjLN9jcrCwsjvjUJyut
         BL8o36bywP42yatnqswZAwCrW7RQpcwUM18jmugN5iMVFJHax7mIBrISm8S0bah2cLg0
         bYhtuz+EyIUI6Nddb2ADLrbJTgYvTm/DxUY/1D4HxbiIfF3mTAqcpVwC8iyyUbnAbud6
         IOgWFWw1Ke7JWykgtbNjqjzk3ToIWmd2MttUrgK+EzV7m7/EOt3rNiLRgjg0p1OzqS/h
         U3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729695273; x=1730300073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l850wXjS4tHwENkmwaNxRgq9Jm5cPfUrAH7USoKxezo=;
        b=SGA1I9bdIbCpHKT6puHkncLWC5Dv5DpiLOx1Pi9C+6UxGFWIMKW6zcthRJDFFffDGM
         ZCEezPqsJPo1l/ntzWF90ah4zGzDpTRSIypJ6cMd8nYIMRBJ24Q3usyq3yCf0lIKBZ4M
         zhDW4ryVjwmF7HUTrZaSVaewdifsA9lgRjD6anPsEavfaM5xx/w2TSXsVbQ3uDbpR71L
         69NUT0SAVe4nYgaHZaebvUe3kllYFtTJe75vv54S8vNbxSRJypkev1EZsb0mmsq/mgIC
         g8AQuikUf02Qyq88p3MCwGLEAWgGf0EEVLK4eR5j0iSH2cYJouY8TMFC5FIi0pyIzajf
         OXDg==
X-Forwarded-Encrypted: i=1; AJvYcCUFlyUobMGJPsga1hA5BdMrvFj6SjjRGON8qLJ3dYtZFjnkFLnFJ0pEg7N1b2PP/0inxn5pYB2RWg==@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwSGLn4tGu9JIbMDCvkRzarUpJZA5M/rzjS7b8XcTftcGB38W36
	ft92bATP60UNmO3P5bI3WNUjY1w+2yvjAn9XxeLVHVn/Nk0S2yd309Gq/+FtNZU=
X-Google-Smtp-Source: AGHT+IFveRuPerad4JTpuTj96NgcoqsqMpbZ/nvPk6LTzlE9POMwGpY4MmDqqP4d7kktgql2ua0AIw==
X-Received: by 2002:a2e:b88b:0:b0:2fa:d354:1435 with SMTP id 38308e7fff4ca-2fc9d1dbb59mr12872591fa.0.1729695272523;
        Wed, 23 Oct 2024 07:54:32 -0700 (PDT)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb9ae1262bsm11158341fa.117.2024.10.23.07.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 07:54:30 -0700 (PDT)
Date: Wed, 23 Oct 2024 17:54:27 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Tom Hochstein <tom.hochstein@nxp.com>
Cc: "Tom Hochstein (OSS)" <tom.hochstein@oss.nxp.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	Sahil Malhotra <sahil.malhotra@nxp.com>
Subject: Re: [PATCH v3 1/2] optee-client: use udev rule and systemd service
 from upstream
Message-ID: <ZxkOI7vA6YDQZewJ@nuoska>
References: <20241017065907.172504-1-mikko.rapeli@linaro.org>
 <PAXPR04MB9448F0D1DE0F84A6634EFBC5E24D2@PAXPR04MB9448.eurprd04.prod.outlook.com>
 <ZxkId04rSl5ykKCJ@nuoska>
 <PAXPR04MB9448DC39953E357F3E73D07EE24D2@PAXPR04MB9448.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9448DC39953E357F3E73D07EE24D2@PAXPR04MB9448.eurprd04.prod.outlook.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 23 Oct 2024 14:54:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6222

Hi,

On Wed, Oct 23, 2024 at 02:34:15PM +0000, Tom Hochstein wrote:
> Sorry I wasn't clear. The new build break is for when we do use systemd. We use sysvinit for QorIQ, but systemd for i.MX.

Ok got it now.

${nonarch_base_libdir} isn't in the CMake toolchain file. We could
move ${libdir}/systemd unconditionlly to ${nonarch_base_libdir}/systemd
in the do_install task. Could you test and submit a patch like below?

--- a/meta-arm/recipes-security/optee/optee-client.inc
+++ b/meta-arm/recipes-security/optee/optee-client.inc
@@ -23,8 +23,9 @@ EXTRA_OECMAKE:append:toolchain-clang = " -DCFG_WERROR=0"
 
 do_install:append() {
     # installed by default
+    mv ${D}${libdir}/systemd ${D}${noarch_base_libdir}/systemd
     if ! ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-        rm -rf ${D}${libdir}/systemd
+        rm -rf ${D}${noarch_base_libdir}/systemd
     fi
     if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
         install -D -p -m0755 ${UNPACKDIR}/tee-supplicant.sh ${D}${sysconfdir}/init.d/tee-supplicant

Cheers,

-Mikko

