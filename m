Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AA83D6ACE0
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 14:27:50 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.72944.1732717668694936411
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Nov 2024 06:27:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=yI1atyNp;
 spf=pass (domain: linaro.org, ip: 209.85.167.53, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53de79c2be4so3438267e87.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 27 Nov 2024 06:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732717667; x=1733322467; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=20zL4F/lb6UhV5zUPD/lbov8hBDxImAihGgevYf2jG4=;
        b=yI1atyNpdrOOJtdHuQug/GXX1LefCKvvjkCCxXlwyB+WfZd6U/7BVhG0w8I+XjU6eZ
         xY8oz8P3FeZ7pUaEcwAtfAJmboEK053Rs9vqv55Qvoya/wTX/YXH3yjmgzF6p8X2gIDT
         95fmLk2BorKIBO/GfO0rnNA6nLE2Hh8R4UuFlv3pNHWWTMsB660US88NIjN8qfpIZe2V
         DvqFstv7r7/H0oWJanH/uyhb7Xq6d96cXZQrytUP5eCM3qQbz1QGlj1i9N2PiM+VWwU5
         fHn65uWAGkU+pfpUx9oa0zMuBE8POdS7a38Ujdsz0hSCfU2fOOvuCSsc6ucIFhpbFgF5
         cWRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732717667; x=1733322467;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=20zL4F/lb6UhV5zUPD/lbov8hBDxImAihGgevYf2jG4=;
        b=pt2NLmBYV6sH4T2wAFNl+8362Kcle1XVy1ylLhN3qzoIHX4ZW03faMhBUDC6RvakEp
         +oOevAN9d2LtKV7qTflDz7s+Fma6B/EA0gAki6hkx++L7Wmyg7ZMWMMl4g8jllK7c7EO
         PxMOMYyOZeqfxIAys1SQnJlIzS6h2twTn2FHN+2ux08iIM5J8mNB8zyuB9EWl3/a446N
         0RV9BBogk+2i+xBv4QWd5K6ZlVz7AsXssa810cnIaH9nPWb+Mk1otkdQW6YTMMBjVM0D
         +fGrGF0q48qyRVI94HlgD52jIkBXBFEp6FGu26/nQzEsFsUDkCkbOGevKhZKMJ5g05Sq
         KbCg==
X-Forwarded-Encrypted: i=1; AJvYcCV++YB0oKX2Bb8M/ImReT9Syfq+vUTIwR5UCAxvtDRY2KGOolBuTBGETI2kGbFAl8YfmtOPu757cw==@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxtGpGId3i81XakazdL7HXveRfSmcFp0CdcNJB8eUO/pHgMKptL
	LUKLHTsIN38XnS5s9+pmth44Zc+mKHFqIgdJJ3RxSFSoMt8cx32wO/aT5WUyk1M=
X-Gm-Gg: ASbGncsKfaSFpaXUdO0zV14OFcp3iZBpWBBqKulgBcj64sRaZHEF+GO9aOY5QCyGs0a
	XdSlqma3/+7KXY1vZvO5JdFJfydESY9CUqApgAqZEVld+KHPDYpw8txpgbWGiNOOjIunTCcEX4a
	QTJee7Iiu2nGs0LRvn2yy/VxFr4QIUYvlH+MAslzQXETniRENecUKeaMzAXoqpYXR9mVuepOWEP
	SSYhAUnxnjshmcYxffygZnxCuA5n0GlOyN1sdG7rG6LFpk6e7HZho0hTWRiXye0etg47nNoGNZ1
	eLFi/XyZdOOw53gKgQ==
X-Google-Smtp-Source: AGHT+IEHWgl/0DJPlNHAfgMXV1AWCNFIthYMMNByUN1zQyeWGXgTcLA+hpjm1UCmwNypysNcaiFKXA==
X-Received: by 2002:a05:6512:3f2a:b0:53d:d2d0:7c8f with SMTP id 2adb3069b0e04-53df00dcf1cmr1805779e87.34.1732717666489;
        Wed, 27 Nov 2024 06:27:46 -0800 (PST)
Received: from nuoska (82-209-143-194.cust.bredband2.com. [82.209.143.194])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53ddc292df1sm1751032e87.151.2024.11.27.06.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 06:27:44 -0800 (PST)
Date: Wed, 27 Nov 2024 16:27:42 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Gyorgy Szing <Gyorgy.Szing@arm.com>
Cc: "tom.hochstein@oss.nxp.com" <tom.hochstein@oss.nxp.com>,
	Tom Hochstein <tom.hochstein@nxp.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	Sahil Malhotra <sahil.malhotra@nxp.com>
Subject: Re: [meta-arm] [PATCH v3 1/2] optee-client: use udev rule and
 systemd service from upstream
Message-ID: <Z0csXjVT9RPAPoj8@nuoska>
References: <20241017065907.172504-1-mikko.rapeli@linaro.org>
 <PAXPR04MB9448F0D1DE0F84A6634EFBC5E24D2@PAXPR04MB9448.eurprd04.prod.outlook.com>
 <ZxkId04rSl5ykKCJ@nuoska>
 <PAXPR04MB9448DC39953E357F3E73D07EE24D2@PAXPR04MB9448.eurprd04.prod.outlook.com>
 <ZxkOI7vA6YDQZewJ@nuoska>
 <7c3c9ad1-a1e0-474f-8710-9b77d2a2ea17@oss.nxp.com>
 <AS8PR08MB589517BA3B9BD14644DEF4CE91542@AS8PR08MB5895.eurprd08.prod.outlook.com>
 <Z0XhVyhlU8uIU1W8@nuoska>
 <AS8PR08MB58955003C2B8CF01CDE7EA54912F2@AS8PR08MB5895.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR08MB58955003C2B8CF01CDE7EA54912F2@AS8PR08MB5895.eurprd08.prod.outlook.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 27 Nov 2024 14:27:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6259

Hi,

On Tue, Nov 26, 2024 at 09:05:15PM +0000, Gyorgy Szing wrote:
> > Hi,
> >
> > On Wed, Oct 30, 2024 at 08:02:19AM +0000, Gyorgy Szing wrote:
> > > Hi,
> > >
> > > (Sorry for the delayed reply.)
> > >
> > > Another way to address this would be to use PkgConfig from CMakeLists.txt (see [1]). This might be considered a nicer solution as the yocto recipe would not have to correct the install location, and thus there would be a single source of truth. (Kudos for Ross for the suggestion.)
> > > Something like (code is not tested):
> > >
> > > Include(FindPkgConfig)
> > > If (PKG_CONFIG_FOUND)
> > >                 # TODO: there are other variables. Doublecheck if systemdsystemconfdir is the right one to be used. On X86 Ubuntu this returns /etc/systemd/system. Yocto might define distro specific values.
> > >                 pkg_get_variable(UNIT_DIR systemd systemdsystemconfdir)
> > >                 # TODO: check the value to see if pkgconfig successfully found the value. Behavior is not documented, probably if (UNIT_DIR) would work.
> > >                 # TODO: UNIT_DIR is a string list, use only the first or last value? Rewrite the line below accordingly
> > > set(CMAKE_INSTALL_SYSTEMDSYSCONFDIR “${ UNIT_DIR }” CACHE PATH “Target directory for system config files”)
> > > endif()
> > > # By default, use LIBDIR
> > > # TODO: CMAKE_INSTALL_SYSCONFDIR might be a better default base dir.
> > > set(CMAKE_INSTALL_ SYSTEMDSYSCONFDIR “${ CMAKE_INSTALL_LIBDIR}}/systemd/system” CACHE PATH “Target directory for system config files”)
> > >
> > > install(FILES ${CMAKE_BINARY_DIR}/${PROJECT_NAME}/tee-supplicant@.service DESTINATION ${ CMAKE_INSTALL_SYSTEMDSYSCONFDIR})
> > >
> > >
> > > The above code would default to the current install location under LIBDIR,  and would use PkgConfig if available. Setting CMAKE_INSTALL_ SYSTEMDSYSCONFDIR from the command line allows manual override.
> > >
> > > 1: https://cmake.org/cmake/help/latest/module/FindPkgConfig.html
> >
> > This would only work if optee-client has "systemd" build time dependency in DEPENDS.
> > I don't think we should add this dependency. The sd_notify() support for example
> > dlopen()'s systemd libs at runtime to avoid making systemd a hard build time
> > dependency. I don't think we should add this dependency due to systemd
> > service file install paths.
> 
> DISTRO_FEATURES seem to reflect if systemd is deployed and this allows the recipe to behave accordingly. Not sure if this is the case for all distros, but poky and meta-arm already depend on DISTRO_FEATURES based systemd configuration and thus might be an acceptable risk.
> AFAIK systemd was added part of uefi-secure boot enablement. If this feature is enabled the native sysroot of the optee-client recipe has systemd already because of some uefi-secureboot specific transitive dependency. Might not be bulletproof but if systemd is needed, things seem to be ok as is. On the other hand, adding systemd conditionally to DEPENDS might not make things much worse since it is included already.

Even when "systemd" is the selected init and in DISTRO_FEATURES,
it is not a build dependency and in DEPENDS of optee-client and thus
systemd pkg-config files are not available.

Yocto recipes and open source SW which ships systemd service files
and even notify systemd at startup using sd_notify() are not meant
to have systemd in their build dependencies. This makes too
many things depend on systemd which results in longer build
times.

Thus I don't want to add systemd to DEPENDS of optee-client.
 
> Please check the attached patch file. I cherry-picked you commit “optee-client: use udev rule and systemd service from upstream“ to my topic branch and added the attached patch on top (among other patches which are hopefully have no effect on optee-client).
> I did some manual testing by hacking DISTRO_FEATURES and running bitbake-getvar, plus testing fvp_base and quemuarm64-secureboot configurations. It’s not 100% tested as e.g. I did not check how the cmake modification behaves if pkg-config is enabled, but the executable is not available or is available but either system or udev package is missing. The cmake code is there to handle these cases though. Anyways these scenarios seem to be out of scope for yocto.

I think this patch is complex enough that it needs upstreaming
to optee-client. I don't agree with using pkg-config settings
from systemd to figure out systemd service file install paths
because that requires adding systemd to build dependencies.

> I added a dependency on udev to the optee-client recipe, to make udevs pkg config data available. This might be considered similar “unwanted bloat” you mentioned related to systemd. I tried to make this conditional but could not find a safe way. According to [1] there is a variable called USE_DEVFS which tells if a device manager is available, but the variable is not visible to the recipe. AFAIK the image class would need to be inherited to get access to it, but that does not seem to be a good idea.

As with systemd, I don't think udev should be in build time
dependencies of recipes which just ship udev rules.
In the same way, udev is not in the build dependencies by default
and I don't think it's a good idea to add it there.

> The op-tee client patch:
>   - adds build options to control if the system service file shall be installed or not. The default value is on, to keep backwards compatibility.
>   - another option is added to enable using pkg-config. This is by default off, and the op-tee client recipe enables it for yocto. If enabled both system and/or udev specific directories are discovered with pkg-config.
>   - the intention was to implement option and pkg-config processing in a flexible way. There are hard-coded default values which keep existing behavior and will be used if pkg-config is disabled or failing.
> 
> Note: I missed the systemd dependency issue and conditional appending to DEPENDS is not implemented.
> 
> 1: https://docs.yoctoproject.org/dev/dev-manual/device-manager.html

Since we disagree on the solution, I'll stop proposing these changes.

It's up to maintainer of optee-client recipe, Jon and Ross,
to decide what to do with newer optee-client releases which do install
a default udev rule and systemd service which use different users and
groups than the meta-arm side optee-client recipe.

I don't think shipping two optee udev rules is good either and thus would
have kept that rule only in optee-client, possibly a separate binary
package.

Cheers,

-Mikko

> /George
> 
> > Cheers,
> >
> > -Mikko
> >
> > > /George
> > >
> > > On 2024-10-29, 18:03, "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org> wrote:
> > >
> > > On 10/23/2024 9:54 AM, Mikko Rapeli wrote:
> > > > Ok got it now.
> > > >
> > > > ${nonarch_base_libdir} isn't in the CMake toolchain file. We could
> > > > move ${libdir}/systemd unconditionlly to ${nonarch_base_libdir}/systemd
> > > > in the do_install task. Could you test and submit a patch like below?
> > > >
> > > > --- a/meta-arm/recipes-security/optee/optee-client.inc
> > > > +++ b/meta-arm/recipes-security/optee/optee-client.inc
> > > > @@ -23,8 +23,9 @@ EXTRA_OECMAKE:append:toolchain-clang = " -DCFG_WERROR=0"
> > > >
> > > >   do_install:append() {
> > > >       # installed by default
> > > > +    mv ${D}${libdir}/systemd ${D}${noarch_base_libdir}/systemd
> > > >       if ! ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
> > > > -        rm -rf ${D}${libdir}/systemd
> > > > +        rm -rf ${D}${noarch_base_libdir}/systemd
> > > >       fi
> > > >       if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
> > > >           install -D -p -m0755 ${UNPACKDIR}/tee-supplicant.sh ${D}${sysconfdir}/init.d/tee-supplicant
> > > >
> > > > Cheers,
> > > >
> > > > -Mikko
> > >
> > > This works fine in our testing. Sorry for the late response.
> > >
> > > Thanks again!
> > >
> > > Tom
> >
> 



