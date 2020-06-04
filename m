Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com [209.85.167.194])
 by mx.groups.io with SMTP id smtpd.web11.9239.1591257664567967666
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 Jun 2020 01:01:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=rT5BTI6i;
 spf=pass (domain: konsulko.com, ip: 209.85.167.194, mailfrom: paul.barker@konsulko.com)
Received: by mail-oi1-f194.google.com with SMTP id m67so4314105oif.4
        for <meta-arm@lists.yoctoproject.org>; Thu, 04 Jun 2020 01:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Pyfk5vxpibQDqxr8yxteje8GALYoLyuU/KuPZBvFKuA=;
        b=rT5BTI6ikJD8F61QFt5jgcWHM6rGrtunl632hwGUdstHB9ewd2m9YNN9kw2CtbgWlZ
         iShA62Q/tDSwT4g5CSinNDpEqljFhjZLFapQB1zmiwlIth2Z3u0Rjn9Rz2u4G13UAFzF
         vOFwz0swTEaaUTnGADO29wdVKVW4KFWQYgKkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Pyfk5vxpibQDqxr8yxteje8GALYoLyuU/KuPZBvFKuA=;
        b=UKfT5++rOO6OnTMUlblct8qf5h3XOzsGGLOadRR+atcc4Qs0tKfipAAxpkwf5EAYju
         jEnkwVSslUSMgbSmP9gnAQ1oLJJRgSx0lkgSpWgEIz7/6hxJu8kGkO8mEBVK18mypN4/
         xVUpyJvJk1jQ+R90goNGJOUS/XwzywCNj0SWVhfBGTTbO5oS5ImPbJdSlCzjRywC++yK
         zTLUfWtTAUf3xeVHjFXpqyeo3rq7XZxTKXNi8XbZlORM/e2rgDBaupuQs45/FEH6R3A6
         YxVbBuGDGwiSShu9VAJzEzW2hj7kQEtV1pcPWr1c5GuBF8fMbEekiWpBAl235sGun1Py
         T5+Q==
X-Gm-Message-State: AOAM533brVQQyjBWY8sX77hkg0qiQkP3IlURxqwKcqnOKk1BBq2ymvC8
	GRgS3gW4SDdBhBftXeLTONXZ4THEMwruj8pGreq+Fw==
X-Google-Smtp-Source: ABdhPJykIGiqP0/a/wdbX7iV8gQEIaROcn6EV9JwblLeFzi9qUVX+wxj4OpIQOAts8HUC1dmTEU9u77iNfu83cqpKqg=
X-Received: by 2002:a54:439a:: with SMTP id u26mr2173399oiv.6.1591257663908;
 Thu, 04 Jun 2020 01:01:03 -0700 (PDT)
MIME-Version: 1.0
References: <1591095894-15178-1-git-send-email-sumit.garg@linaro.org>
In-Reply-To: <1591095894-15178-1-git-send-email-sumit.garg@linaro.org>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Thu, 4 Jun 2020 09:00:53 +0100
Message-ID: <CAM9ZRVs0rOqiA9oHe6Ldx2QJpQhjyDZtp0NxpCcu39WdeyQf6A@mail.gmail.com>
Subject: Re: [PATCH 0/4] external-arm-toolchain: Add support for SDK generation
To: Sumit Garg <sumit.garg@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, denis@denix.org, wmills@ti.com, 
	daniel.thompson@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Jun 2020 at 12:05, Sumit Garg <sumit.garg@linaro.org> wrote:
>
> Patch #1 and #2 adds impprovements in external-arm-toolchain recipe in order to
> support SDK generation. SDK generation has been tested using:
>
> $ bitbake core-image-base -c populate_sdk
>
> Patch #3 adds a README to describe usage details of pre-built Arm tool-set.
>
> Patch #4 adds package specific licences for external-arm-toolchain recipe.
>
> Sumit Garg (4):
>   external-arm-toolchain: Remove glibc locale dependency
>   external-arm-toolchain: Refine dev libraies packaging
>   external-arm-toolchain: Add README
>   external-arm-toolchain: Add package specific licenses
>
>  .../conf/distro/include/tcmode-external-arm.inc    |  1 +
>  .../external-arm-toolchain/README.md               | 50 ++++++++++++++
>  .../external-arm-toolchain.bb                      | 29 ++++++++-
>  .../external-arm-toolchain/license.inc             | 76 ++++++++++++++++++++++
>  4 files changed, 154 insertions(+), 2 deletions(-)
>  create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/README.md
>  create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
>
> --
> 2.7.4

Thanks for these, they all look good at first glance. I'll have some
time to properly review and test the changes in a couple of days.

-- 
Paul Barker
Konsulko Group
