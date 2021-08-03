Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web12.1485.1627969775133365652
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 02 Aug 2021 22:49:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nIp3yOGg;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id 190so18872376qkk.12
        for <meta-arm@lists.yoctoproject.org>; Mon, 02 Aug 2021 22:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0XuY1GGy7p6Pxk8UP4AT+LUTSREdJKYBRKrkFOyj7R4=;
        b=nIp3yOGgjdsQU9iQZIDn99RRLCuSrZV9zZBTeX8L0rkpBTYKl/aKEs5UCYPgXlefD5
         r3f2YQq45PVfBm/33JHhAJ9ar4Ik4IpWVZbPgcvUYPP6lJLDkaBgIY722gbmhq2/53k2
         3Ynx+GcP+qhh/Becne8Lw15qdhmdGYWYXn/pryJe3r99qBRPJg2VUN0ovHuhqvXHaMyf
         I1/mVIho0PQkb3Le3BOOPy5GNT6QNcLLs0w8A9ljm5QcWsbJLVFXNKzF46GLsT1R7A5Z
         WW/5M8wjXul+ay23EagyN7OBX4fNzOXn8BY9k4xuW9tLZ1N2MbkW9JP2gZO/GxKn/2np
         +GzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0XuY1GGy7p6Pxk8UP4AT+LUTSREdJKYBRKrkFOyj7R4=;
        b=NkO03F38X8ub1PLZy+xZ4QnJ+In6p75krE6bzbxrFzRJaTfgP15navaB/RT8P9KcXl
         6c6eo3t3z2aIa5AWwSKVbbcAcCz1A1wr4aa0WPntmApaTypaLfIKChX7Ur/Ul/yuT9ID
         FTQAbWbHz4zhp5hqRFipKHKPeM/dDao5YW6h0CURSrv1DKguQHsxxEC/I8MyEa1pfyKm
         KR/TO+oanOtl3QI3u6CyrU+bje0NA77FbzeQTGLkfy1ecYy0EkrZyLW4ZWduRkpi5lAB
         Ae6gcEXZnf6586uN7qhVIAaFIl/eJUUXwIfWcUYnaPBkaT5ZywZQ1GzcPrOkGzSKuWRk
         ix6g==
X-Gm-Message-State: AOAM5312MNtD1Fgzle6xXfRclWKQJhvxQteC7Rsoxa0B5ba+RU1RsAAu
	2d9EN9Pfu9rmjZYyI/KE4WrQcawjREAVj0pk7z4=
X-Google-Smtp-Source: ABdhPJyWFFmWmy5Uw9ei4qWpw0mucSOfYCJjnOXuhHuIMnd5DstR3iZlpX1+a8xdkh+7FzR/35VnRoZseTB4QBaq9jA=
X-Received: by 2002:a05:620a:31a1:: with SMTP id bi33mr18948282qkb.146.1627969774088;
 Mon, 02 Aug 2021 22:49:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210802163550.4391-1-raj.khem@gmail.com> <CAFA6WYODdz23qfQVWFNb5NFb5EmNv4s_fv4sf9jcGsxOHPWe3Q@mail.gmail.com>
In-Reply-To: <CAFA6WYODdz23qfQVWFNb5NFb5EmNv4s_fv4sf9jcGsxOHPWe3Q@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 2 Aug 2021 22:49:08 -0700
Message-ID: <CAMKF1spBw8ExPHs6i00ScBViOGSDHWoeS63k+Sixwg4v+BKcDw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] meta-arm-toolchain: Convert to new override syntax
To: Sumit Garg <sumit.garg@linaro.org>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

yeah ignore this. I have more changes after this

On Mon, Aug 2, 2021 at 10:25 PM Sumit Garg <sumit.garg@linaro.org> wrote:
>
> Hi Khem,
>
> On Mon, 2 Aug 2021 at 22:05, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta-arm-toolchain/conf/layer.conf | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf/layer.conf
> > index 04486d4..41305ee 100644
> > --- a/meta-arm-toolchain/conf/layer.conf
> > +++ b/meta-arm-toolchain/conf/layer.conf
> > @@ -18,4 +18,4 @@ LAYERSERIES_COMPAT_arm-toolchain = "hardknott"
> >  BB_DANGLINGAPPENDS_WARNONLY = "true"
> >
> >  # These variables are used for armcompiler license
> > -BB_HASHBASE_WHITELIST_append = " ARM_TOOL_VARIANT ARMLMD_LICENSE_FILE LM_LICENSE_FILE"
> > +BB_HASHBASE_WHITELIST:append = " ARM_TOOL_VARIANT ARMLMD_LICENSE_FILE LM_LICENSE_FILE"
>
> This only looks like change for one instance of override and there are
> many other instances in meta-arm-toolchain. I think the new override
> syntax brings more clarity. So I would suggest converting all other
> instances of overrides to new syntax as well.
>
> -Sumit
>
> > --
> > 2.32.0
> >
> >
> > 
> >
