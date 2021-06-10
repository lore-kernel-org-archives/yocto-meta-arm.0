Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web09.10358.1623333439527262620
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 10 Jun 2021 06:57:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KzZMow7z;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id k11so25756607qkk.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 10 Jun 2021 06:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4yB7ZxS4e0XPb8KjcpF9p7ACvypFmKNdrOsNUw7z3/4=;
        b=KzZMow7zatkH1daCVygNOruO0zo5jrj5tGiVnQHt8QxAJr12AzI9cfngyjwBgyBDBL
         A3kfQBqo/9+r5sNOp+IrxaN5s/HrJVJ2lQ4aUXFSRiALIz0QGCFkkjSJye0z665V1rLq
         g7M/6MK20Nq7XP1XnN6DIAgsr1qCrKqVzT5ByEkVsUhhqc+6vCzArLXu5LqyADjAa3AY
         AqYdViYudplAfzMxJkuRgzQqkDyotj0vRvr0pdW7FbKvIZNujNO/DjYDi4fFEX2kZrx+
         qrlxiY4INNFXnvvH9+sFAYADbVTCU0q4bP0U/JcP78zech11VULl2k0uWfQu/0feOLEK
         /KJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4yB7ZxS4e0XPb8KjcpF9p7ACvypFmKNdrOsNUw7z3/4=;
        b=SNdCYXHcoDzMCD0NqSXvfKEqozxJNRrBRXDaxTFh2XnzRkgG6lWipKhZovIL8xfv3q
         Crcu9Y97uYc8vm4UBVHl87PFMOWIp6WBskp9ipbFerrB0uwS4Tti9zq9ORyTdMC0FU02
         sIABixVU83YBL56P6FazQuyRUlpuLXLqAhLh/3GQcJ1JU1vtnSHdcnEvqXTlpr4Xn7Im
         jkHn6SVvr4hCkcda7InkAglv5HgLcfK3p1rIylpnKkwcVxHufeIDR1iyTHHzR9UhQEeY
         OsibzDSsK9JU1Vzw4eoc4Z3/pUv4hGjXOIPnOH7PKdn4mjKG/3Ij9drX7EingbpIHqlu
         ou/g==
X-Gm-Message-State: AOAM530J2UHdsAgJebxN0RFtdG9JKQ26oiEmxrBGhxXoXaymkqbN17RW
	zFRo3TTi0jYaVJZ/vGUOG8vtu8diAKm9+57hPLqNfcF3FggjCg==
X-Google-Smtp-Source: ABdhPJzqz71zoCrp094l51Tt0OuQeRIT0/lBquMGTkw5yPz4iildpQcdlT1NWPaiAx+cq38t4UlZYsadC7H1JiPzwm0=
X-Received: by 2002:a37:855:: with SMTP id 82mr4908538qki.25.1623333438368;
 Thu, 10 Jun 2021 06:57:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210610072255.2136693-1-raj.khem@gmail.com> <CAAnfSTvnnEAoE2v4Uk+0szLuwu3Q0m1kfVG=58a9byh4AXfXqA@mail.gmail.com>
In-Reply-To: <CAAnfSTvnnEAoE2v4Uk+0szLuwu3Q0m1kfVG=58a9byh4AXfXqA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 10 Jun 2021 06:56:52 -0700
Message-ID: <CAMKF1srXgMCGwe+1ECfpHKCD1KsttxM4SfHiw9ysQAQDWy315Q@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] sbsa-acs: Adjust target tuple for clang
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 10, 2021 at 2:13 AM Ross Burton <ross@burtonini.com> wrote:
>
> As those files are part of EDK2 not ACS, this should be in the
> edk2-firmware recipe itself.
>
> Which leads to the questions 1) why is this a problem on acs and not
> edk2-firmware, and 2) how can we fix this upstream?
>

this patch did not fix the issue entirely see
https://errors.yoctoproject.org/Errors/Details/586266/

the issue is that when cross compiling with OE we have to match
-target option to
TARGET_SYS variable. So some sed stuff which can insert TARGET_SYS would
be required.  Upstream assumes cross compile tuples, which is
limiting, they could
offer an option to accept it from environment in that case we can set
it via recipe.

> Ross
>
> On Thu, 10 Jun 2021 at 08:22, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Current settings assume glibc tuples and hence when building with musl C
> > library clang can not find correct cross tools and system headers and
> > libraries
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Jon Mason <jon.mason@arm.com>
> > Cc: Ross Burton <ross.burton@arm.com>
> > ---
> >  meta-arm/recipes-test/sbsa-acs/sbsa-acs_3.0.bb | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/meta-arm/recipes-test/sbsa-acs/sbsa-acs_3.0.bb b/meta-arm/recipes-test/sbsa-acs/sbsa-acs_3.0.bb
> > index 173cfa7..20d6534 100644
> > --- a/meta-arm/recipes-test/sbsa-acs/sbsa-acs_3.0.bb
> > +++ b/meta-arm/recipes-test/sbsa-acs/sbsa-acs_3.0.bb
> > @@ -24,6 +24,11 @@ EDK2_EXTRA_BUILD = "--module ShellPkg/Application/sbsa-acs/uefi_app/SbsaAvs.inf"
> >
> >  PACKAGES_PATH .= ":${S}/edk2-libc"
> >
> > +do_configure_prepend_libc-musl() {
> > +    sed -i -e "s/-target arm-linux-gnueabi/-target arm-linux-musleabi/g" ${S}/BaseTools/Conf/tools_def.template
> > +    sed -i -e "s/-target aarch64-linux-gnu/-target aarch64-linux-musl/g" ${S}/BaseTools/Conf/tools_def.template
> > +}
> > +
> >  do_install() {
> >      install -d ${D}/firmware
> >      install ${B}/Build/${EDK2_PLATFORM}/${EDK2_BUILD_MODE}_${EDK_COMPILER}/*/Sbsa.efi ${D}/firmware/
> > --
> > 2.32.0
> >
> >
> > 
> >
