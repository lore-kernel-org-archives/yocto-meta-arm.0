Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4380ED3B99D
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 14:55:33 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.47541.1732632925749775159
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 26 Nov 2024 06:55:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Ggd8/mkv;
 spf=pass (domain: linaro.org, ip: 209.85.167.42, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53ddd4705f8so2867579e87.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 26 Nov 2024 06:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732632924; x=1733237724; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UMHHSGSw7L3C1tuN3WrvzndyRd02U1WecX56Rr9rGvI=;
        b=Ggd8/mkvmaDqz5NqlJ9RF5BAYSXpWB1JgN83a480Qtq5W5iy7VDY/C9RCA/VItn/ss
         h5sAJ0YJCK1xWhpKUe1etgPnCT+7mRYnyICkJV1xsRVqnjFVqNZajJwxZn3RtKRDn14F
         T0ah64numkVDtBx8Mt3S6GVP3BtNIpb6lkhk/SDQy+lgnzgMzGkRKBteCVJOtZrGCw/T
         0C3eDioexFXYgsGmM7nze3VBi/T/FQS49VjsyZz5w51eZTcwE1BrSWUx5txC9HLK3Tw1
         KtGFflb/W8vinLffeblegdq2aBkmE0PpvibnRNBNZUa6WMH+7WmUAWsb/062b7sKEzn2
         AiBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732632924; x=1733237724;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UMHHSGSw7L3C1tuN3WrvzndyRd02U1WecX56Rr9rGvI=;
        b=twUYgviYorJ/Vhupet22OpuaXADzJvgwwwwJ7WaAt8vBwm7h8p/KA/VQ0r8Gl+Eere
         rfZZ8a0qs1wr/Wx/f2+M6lAR7FWH/+V32Zg/0Nv7P6nemR/kVM1+7kY4hjEtJaSJhBqw
         T2EWbxWnNRctaE9/EJ5jNslGW9b/gp78GNi8BzSnWD2hhN1PXN2ILQwFlvam/8bDYzMi
         qYOj1EL8pOcUE9l1cQ059unKpXhhmLnQUWLhAp9+3OnsgPMhrRUS0vXsuIkE+VLhoH6X
         TIyZix3RCGhU5jdRT6Pjc67mdSLhXKiYtB1DxAyel4IPq/iQrve6qpw3MslJ1pohDxh0
         C9Wg==
X-Forwarded-Encrypted: i=1; AJvYcCW+NmAxjV6w9kSmjAqbkjlBZUK6huLWCSEkA4JQs918rcXnt7fhOjREmRmmUdvouMCD1r1dVGHQxQ==@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwBdpM8l26CEkYkh8qouJPAG0PDfXV9/YH9B+SJXlbWXkhP0IYq
	wCi48N6Z2dBLvq8ejFYgdAbSqAGgB5H8MEoovRuWAG/KOHr0fTKLjbYnb626yvs=
X-Gm-Gg: ASbGncvXrVJhoIvADVuDAfkBQRZq2+9DBZuyCbIwLxO73zsIOK7X0KZWVyDfeRpw14c
	alfLFDIGEl2MqzXGrvb7wpwnkneMkOO6io9VHabrNSg4qbY+/7zRuds3qhigEsxE6bZ4jgt+IKu
	UEVFOBeCNDJjLXuzpnl/Xx0+sno2B1io87fFRJgYJMCgrsmZvdmpJOOvujWQQ0xYuKCFwERtx1H
	T6HmKJqJ4+27GWTeJ52AvPH0W9RhcZSdSm/u+v6ynrYt4jVv3uHJTMj8BqO9RGs+o9kLDCoVqld
	gvO8sIb9Rjvfn2Yg5w==
X-Google-Smtp-Source: AGHT+IGVyrXRnbrvcJZvzwyHh5rOUqIYVwQ/O3r9JFxjo7WG8HQPTHGewKMQvvwtb2oiblTDyAESSA==
X-Received: by 2002:a05:6512:10d6:b0:53d:dfbd:3e68 with SMTP id 2adb3069b0e04-53de8818efemr1058758e87.7.1732632923709;
        Tue, 26 Nov 2024 06:55:23 -0800 (PST)
Received: from nuoska (82-209-143-214.cust.bredband2.com. [82.209.143.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53ddc292df1sm1462641e87.151.2024.11.26.06.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 06:55:22 -0800 (PST)
Date: Tue, 26 Nov 2024 16:55:19 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Gyorgy Szing <Gyorgy.Szing@arm.com>
Cc: "tom.hochstein@oss.nxp.com" <tom.hochstein@oss.nxp.com>,
	Tom Hochstein <tom.hochstein@nxp.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	Sahil Malhotra <sahil.malhotra@nxp.com>
Subject: Re: [meta-arm] [PATCH v3 1/2] optee-client: use udev rule and
 systemd service from upstream
Message-ID: <Z0XhVyhlU8uIU1W8@nuoska>
References: <20241017065907.172504-1-mikko.rapeli@linaro.org>
 <PAXPR04MB9448F0D1DE0F84A6634EFBC5E24D2@PAXPR04MB9448.eurprd04.prod.outlook.com>
 <ZxkId04rSl5ykKCJ@nuoska>
 <PAXPR04MB9448DC39953E357F3E73D07EE24D2@PAXPR04MB9448.eurprd04.prod.outlook.com>
 <ZxkOI7vA6YDQZewJ@nuoska>
 <7c3c9ad1-a1e0-474f-8710-9b77d2a2ea17@oss.nxp.com>
 <AS8PR08MB589517BA3B9BD14644DEF4CE91542@AS8PR08MB5895.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR08MB589517BA3B9BD14644DEF4CE91542@AS8PR08MB5895.eurprd08.prod.outlook.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 26 Nov 2024 14:55:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6257

Hi,

On Wed, Oct 30, 2024 at 08:02:19AM +0000, Gyorgy Szing wrote:
> Hi,
> 
> (Sorry for the delayed reply.)
> 
> Another way to address this would be to use PkgConfig from CMakeLists.txt (see [1]). This might be considered a nicer solution as the yocto recipe would not have to correct the install location, and thus there would be a single source of truth. (Kudos for Ross for the suggestion.)
> Something like (code is not tested):
> 
> Include(FindPkgConfig)
> If (PKG_CONFIG_FOUND)
>                 # TODO: there are other variables. Doublecheck if systemdsystemconfdir is the right one to be used. On X86 Ubuntu this returns /etc/systemd/system. Yocto might define distro specific values.
>                 pkg_get_variable(UNIT_DIR systemd systemdsystemconfdir)
>                 # TODO: check the value to see if pkgconfig successfully found the value. Behavior is not documented, probably if (UNIT_DIR) would work.
>                 # TODO: UNIT_DIR is a string list, use only the first or last value? Rewrite the line below accordingly
> set(CMAKE_INSTALL_SYSTEMDSYSCONFDIR “${ UNIT_DIR }” CACHE PATH “Target directory for system config files”)
> endif()
> # By default, use LIBDIR
> # TODO: CMAKE_INSTALL_SYSCONFDIR might be a better default base dir.
> set(CMAKE_INSTALL_ SYSTEMDSYSCONFDIR “${ CMAKE_INSTALL_LIBDIR}}/systemd/system” CACHE PATH “Target directory for system config files”)
> 
> install(FILES ${CMAKE_BINARY_DIR}/${PROJECT_NAME}/tee-supplicant@.service DESTINATION ${ CMAKE_INSTALL_SYSTEMDSYSCONFDIR})
> 
> 
> The above code would default to the current install location under LIBDIR,  and would use PkgConfig if available. Setting CMAKE_INSTALL_ SYSTEMDSYSCONFDIR from the command line allows manual override.
> 
> 1: https://cmake.org/cmake/help/latest/module/FindPkgConfig.html

This would only work if optee-client has "systemd" build time dependency in DEPENDS.
I don't think we should add this dependency. The sd_notify() support for example
dlopen()'s systemd libs at runtime to avoid making systemd a hard build time
dependency. I don't think we should add this dependency due to systemd
service file install paths.

Cheers,

-Mikko

> /George
> 
> On 2024-10-29, 18:03, "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org> wrote:
> 
> On 10/23/2024 9:54 AM, Mikko Rapeli wrote:
> > Ok got it now.
> >
> > ${nonarch_base_libdir} isn't in the CMake toolchain file. We could
> > move ${libdir}/systemd unconditionlly to ${nonarch_base_libdir}/systemd
> > in the do_install task. Could you test and submit a patch like below?
> >
> > --- a/meta-arm/recipes-security/optee/optee-client.inc
> > +++ b/meta-arm/recipes-security/optee/optee-client.inc
> > @@ -23,8 +23,9 @@ EXTRA_OECMAKE:append:toolchain-clang = " -DCFG_WERROR=0"
> >
> >   do_install:append() {
> >       # installed by default
> > +    mv ${D}${libdir}/systemd ${D}${noarch_base_libdir}/systemd
> >       if ! ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
> > -        rm -rf ${D}${libdir}/systemd
> > +        rm -rf ${D}${noarch_base_libdir}/systemd
> >       fi
> >       if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
> >           install -D -p -m0755 ${UNPACKDIR}/tee-supplicant.sh ${D}${sysconfdir}/init.d/tee-supplicant
> >
> > Cheers,
> >
> > -Mikko
> 
> This works fine in our testing. Sorry for the late response.
> 
> Thanks again!
> 
> Tom

