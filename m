Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFAFCC433EF
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 17:51:00 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.10637.1637171459477120142
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Nov 2021 09:51:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=CyKBeEIO;
 spf=pass (domain: burtonini.com, ip: 209.85.128.41,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f41.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so2775636wmd.1
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Nov 2021 09:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Eil1ITUxM116yPzijB3Y2GtBjE3o4v4PZyqOgLsYomk=;
        b=CyKBeEIO3mQ1eL0a2gYKXWzraWSWBP/414I4BBmmM1YF0Yn4oAgIxzVViWS96xelS7
         hJDtVJsuH7VP3tx4gipjfgmYn20no+4KBQMDxwyp2ZLfH41BMbi7a3I7IukL7vIKyogX
         Me793ceHgplh1kh9moUwnXMrcj19GNghRmY88LVK56QT/GWNBRl2zs0pAOwjMM9B7ddD
         rWsNX7Rnzh7kb7BI1bLo3qxNiJ2TIeO1I/3ijdVtWrqgyyBbXZuo/ygzVdjMQdRtkMFo
         iAG+MqGgYzs506jzQ5DE3RCAwi1D9/ZVp09Lk28AL5UInvCinji7+oF9YDCLlfm3D1gH
         awkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Eil1ITUxM116yPzijB3Y2GtBjE3o4v4PZyqOgLsYomk=;
        b=m+8bdOxxFxg4rYxtbk8CH4j3+TQA1027nUkJc9hj/fOD+/V36HGwYt3Pxj5o19rGtz
         Thsx9Khf+HiACLgo1N24IDwME+MjM6HxTYYmt2Veaq2xr8fqbJ/vHfeN0qSn6Rhp0nR3
         GWFUIHOfKnTHRV8WCjqBr1gX0tIOQZHFaYJenPm/Zl5f+DfNtfSucQlGlPMaeN91QTsx
         FSlXB6gcpZlwtVIxYlyJ+QVvysd7IGuZZksnxijfWtJ08QY9JeT+8NmDVU3U8yJvcJCO
         c7juDEcEViGIUELa0uKdik8gCJnPDc0u2CAk3kMqzn2Xzvi75zjsrSfCHDA9dD1ovhz7
         Zdsg==
X-Gm-Message-State: AOAM531sTTv34AAmIbG/oG4wwLpaCwwbgPSaNJUX5pKOa64buasisJpE
	LUWDFmyYrfQzSU5SmyQRDOghbxW+YntGWGxnGv8vhQ==
X-Google-Smtp-Source: 
 ABdhPJxI0J00E7Hex84U0KNfgGfrELde2BnkwngCG9x4i88sBr1ECiHFqKHIE/oSXX0E9OFsH7MJtNxhpVAjhHRgyuk=
X-Received: by 2002:a1c:7e41:: with SMTP id z62mr1893577wmc.62.1637171456810;
 Wed, 17 Nov 2021 09:50:56 -0800 (PST)
MIME-Version: 1.0
References: <20211117100210.1401-1-maxim.uvarov@linaro.org>
 <20211117100210.1401-2-maxim.uvarov@linaro.org>
In-Reply-To: <20211117100210.1401-2-maxim.uvarov@linaro.org>
From: Ross Burton <ross@burtonini.com>
Date: Wed, 17 Nov 2021 17:50:45 +0000
Message-ID: 
 <CAAnfSTve86ukvNZSPgGSxP-ACVMBQTygOeX81U2tHexRa8umhw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCHv5 2/3] add optee-ftpm
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, Jon.Mason@arm.com, ross.burton@arm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 17 Nov 2021 17:51:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2418

On Wed, 17 Nov 2021 at 10:02, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> --- /dev/null
> +++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0000-fix-ssl-fallthrough.patch
> @@ -0,0 +1,20 @@
> +fix gcc compilation
> +
> +just fix compilation under gcc.
> +Upstream-Status: Submitted [https://github.com/wolfSSL/wolfssl/pull/4563]

Good news!  This can be Backport now as the change was merged. Please
refer to the commit SHA so we can easily verify in the future.

> +inherit autotools-brokensep deploy pkgconfig gettext python3native

The package doesn't use autotools, so don't inherit autotools.

Also suspicious of pkgconfig and gettext.

> +B = "${S}"

Not needed.

> +# fails with j > 1
> +PARALLEL_MAKE = ""

Please file a bug with whatever component fails.

Ross

