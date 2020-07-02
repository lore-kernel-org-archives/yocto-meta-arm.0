Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
 by mx.groups.io with SMTP id smtpd.web12.2764.1593681308381256082
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 Jul 2020 02:15:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=IE5Ey5su;
 spf=pass (domain: burtonini.com, ip: 209.85.167.68, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f68.google.com with SMTP id d21so15569712lfb.6
        for <meta-arm@lists.yoctoproject.org>; Thu, 02 Jul 2020 02:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q+WHRwFKJZNDz82xrtpVXIY3tnwfTO1KKsO0bcdEVAU=;
        b=IE5Ey5suEe8oHTTmV6+du73f465lbnW3hps0VPF5cGAU7Te+cBc/e3miRZxWhj4q8J
         nkl0L22ANUwRSyvsL71gGTeMIoALVLOCFe1TcW1oUyB1p19s2NxsW0xTLPFcB9HRQm4/
         PTqkk2yQ8oakqc+nbVIGkQncsKhlBg5IDkvvTlEoR/EpkfbzJR2BhOH43DPsk2Suhz9T
         06vnk8pKCIDxZhnEyaX2BIsSEFdD1Eyu2QxjNcH75rJVQbLSvtmSc6yFvN3dp94/qmjT
         HuOW4dn9W0cY6JSP8J1U6Oi9nFPGIcBRPRnFjRBpwutsrRZk/mpUxPeRYPoJtIUPAfZc
         s4Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q+WHRwFKJZNDz82xrtpVXIY3tnwfTO1KKsO0bcdEVAU=;
        b=AkFBkytgcdDZZKpoqtwVE51W8dF8ihNvQ2EhiRFtFcdJU/TCGMnlA8FMhbYw+a9UJs
         46Z2rNWZSSsHihpAwvVsVeFn8gl9f4/NGd9/6Vb4xX4N6vR2yIOMvKKRhgMBPxuGm6E3
         kAKCj8AGBHL6QKJFBGbqm7tKG/JHl5abye1DtYHjFQ8VbNLkPpZycDseAJF7AEpTittA
         izjmjqndmcFUg2KdiZi55CPO+RBpZfwCmQDfAs1MPAiJ9oL/Uk9bsyJWXkNeBtYK8aRn
         U1onsDVLv0XdN6i3hFjau/ZmMaF5Wbuy2aqxJVJNLcUY9bEd8J9zOB4Ls3NvzWOiIGLB
         GH+A==
X-Gm-Message-State: AOAM530XGrVcPkok8wLQtAujDG5qkgdOnf8ggpF4aSIE5wrWc40cOiTx
	2+QHRk8RDRI3N8pd3iYgKspueQUWJLATSMAfvH1+7g==
X-Google-Smtp-Source: ABdhPJxexcbjZHNP7GWfjtjjIphfiSAizPAtMBn1B2xzEGOa3O+aGHCsHnQrtevxIn3OH02NVNDI0/jnQXuTBBDhTI0=
X-Received: by 2002:ac2:5296:: with SMTP id q22mr17503112lfm.106.1593681306368;
 Thu, 02 Jul 2020 02:15:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200622071401.2570-1-gabor.abonyi@arm.com> <20200622071401.2570-5-gabor.abonyi@arm.com>
 <20200622164936.GF17660@denix.org> <20200622172654.GC14044@kudzu.us>
 <20200622173611.GG17660@denix.org> <e4cd2080-3747-9ead-d307-6394caba82d1@gmail.com>
 <VI1PR0802MB2414E9F9AB2A65D5B27A7DE68E940@VI1PR0802MB2414.eurprd08.prod.outlook.com>
 <20200701180840.GT17660@denix.org>
In-Reply-To: <20200701180840.GT17660@denix.org>
From: "Ross Burton" <ross@burtonini.com>
Date: Thu, 2 Jul 2020 10:14:55 +0100
Message-ID: <CAAnfSTu3YvnOKHug6ifScDHSYQBPhVEkd7FAY4EN0xwot=6LsA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 4/6] arm: trusted-firmware-m: Add recipe
To: Denys Dmytriyenko <denis@denix.org>
Cc: Gabor Abonyi <Gabor.Abonyi@arm.com>, "JPEWhacker@gmail.com" <JPEWhacker@gmail.com>, 
	Jon Mason <jdmason@kudzu.us>, 
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 1 Jul 2020 at 19:08, Denys Dmytriyenko <denis@denix.org> wrote:
> meta-arm is meant to be a central place for shared components to be used by
> other BSPs. Kind of a community layer, if you like. And arm-toolchain is kind
> of a special layer and may not be desirable by all BSPs, so that would reduce
> overall usefulness of meta-arm layer. Each individual BSP (and meta-arm-bsp is
> one of those) is free to depend on arm-toolchain layer directly, if needed.

Arguably, tfm should be in meta-arm for the same reasons that tfa is:
it's a shared component and not specific to a single BSP.

The need for a binary toolchain is not ideal but simply adding the
layer doesn't cause it to be used by all recipes.  I propose that we
add this series now and evaluate the use of multiconfig to build a
second cross compiler in the future (sooner rather than later).

Ross
