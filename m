Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
 by mx.groups.io with SMTP id smtpd.web12.659.1602689507235185659
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Oct 2020 08:31:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries-io.20150623.gappssmtp.com header.s=20150623 header.b=SShD65Mi;
 spf=softfail (domain: foundries.io, ip: 209.85.210.66, mailfrom: ricardo@foundries.io)
Received: by mail-ot1-f66.google.com with SMTP id e20so3777555otj.11
        for <meta-arm@lists.yoctoproject.org>; Wed, 14 Oct 2020 08:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries-io.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CT057DlauWyJCm9Puh3iu6LntDWvu/S8M6d6fjm0bSM=;
        b=SShD65MinXwa7M1f4mt1TP5aTP1uVf9a7R6AGYcl9I2q18K5m1R0CmFjA3fQmSYZuQ
         h+POwLXDChGM26G4EONakON3GrvxcV6vkcBJqz49zaxrO4UKSG7NyAPpkzaL0ADVN9Z3
         58+Ti++KRdWBrrOZwMjxfGNqR/G4NtynNndp0WDhagCaMXjYUum6DbaN0SHbmLbdleER
         N3RO89NsGrwoDpNDqvdl2+OTHG0oJ/OGE0QrvaQrFFH5q91dcn0Xyzl+nEpLe+Ua/paw
         FGkXAzSNv6IBK3X1Eww7fGUWyMk7VCkFOjLEot78HHsPzJhbfkXjdlRWr7jNTYWxQ7Dn
         OpIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CT057DlauWyJCm9Puh3iu6LntDWvu/S8M6d6fjm0bSM=;
        b=imUa4FZ/vVHh9aIdazPeIriaZPIGWMXA7n+uonkSd4uP+9psVjSuJJR78i1vosLPho
         OytO+TMVHIuww7m2ymOgBmsTvRFIDMhn9hObRi+lG48toCWlBt3CFaQ2qmMgR6jm8sHP
         dZgLOFtdSBeyq02jNHXacNpaGF7tr2j7Fujg+G7ZsOpb1Pqxme1xSO9mMwyAK1YVzfPf
         IcVP2ran4m60YBB/AEL4x5lwlr3yGas+NIkOO4LMp7IRzPm74PTx4qMIK+0P4eHiutoN
         E4g1WCMu/LePbUxClPW5nKqQEV1QOhl2ZoFLKWFaLjlUDTv7B30SP4AfFZP2oZ4Jcqip
         wb4A==
X-Gm-Message-State: AOAM532IERlj6wABWwD3HKm9+Lr+jzr1X/H4B4nzBj8Y5RuFtwgrjo2U
	cSol4rzmCV40FVKs8JujD6Ttm8kKwI9XnC2IMUxB
X-Google-Smtp-Source: ABdhPJwTmO28WRSzI50FNHeZ/kuAzZUCAbKU2M8dSoewtVLsfTI+SSu2iLXcf8qr3zkKrcgLrS9oAYMEICWRNf2mJYE=
X-Received: by 2002:a9d:1442:: with SMTP id h60mr4197893oth.35.1602689505944;
 Wed, 14 Oct 2020 08:31:45 -0700 (PDT)
MIME-Version: 1.0
References: <8kyH.1602675228543077329.RykC@lists.yoctoproject.org>
In-Reply-To: <8kyH.1602675228543077329.RykC@lists.yoctoproject.org>
From: "Ricardo Salveti" <ricardo@foundries.io>
Date: Wed, 14 Oct 2020 12:31:09 -0300
Message-ID: <CAAaKDhHbidD1RNKXPruxDF+DJT=eHjPQGXFRaHGLqJCXZ6_+3g@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 2/6] optee: upgraded recipes to 3.10
To: Brett Warren <brett.warren@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 14, 2020 at 8:33 AM Brett Warren <brett.warren@arm.com> wrote:
>
> The optee recipes were upgraded due to issues booting with 3.8
> on qemuarm64-secureboot, which were resolved by the upgrade.
> The 3.8 recipes are retained for backwards compatibility.
>
> optee-test and optee-examples were modified to pass a sysroot
> to the LIBGCC_LOCATE_CFLAGS parameter, to ensure proper location
> of the libgcc library.
>
> Recipes have been renamed to reflect their current version.
> As this makes the PV variables redundent, these have been removed.

OP-TEE 3.11.0 should be released in a few days (if not tomorrow), so
wonder if it would be just better to move to that revision instead?

https://github.com/OP-TEE/optee_os/pull/4101

Then we won't have to keep 3.10.0 around, as done with 3.8.0.

Cheers,
-- 
Ricardo Salveti
