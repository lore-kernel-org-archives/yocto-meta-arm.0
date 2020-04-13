Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web10.9869.1586755301118974317
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 12 Apr 2020 22:21:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=wFcBhgkv;
 spf=pass (domain: linaro.org, ip: 209.85.208.196, mailfrom: sumit.garg@linaro.org)
Received: by mail-lj1-f196.google.com with SMTP id z26so7568182ljz.11
        for <meta-arm@lists.yoctoproject.org>; Sun, 12 Apr 2020 22:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6yf2ZD9aZdxpsZfYRw8m1MM2r5zL8kLaUjZ1gmee+FU=;
        b=wFcBhgkv/+pHvIUxUxdq9cl1TK/hvdm0uZzVHY07f+JtaUEoGwKYNd5OoaLduyrl4M
         HtrTS4eGLljoIdXIOzqOwMf3j35so2gewVzcq6czVHudSqYmaCDoAzW/qV3iFoQeu1Kc
         nKsTvYHlpcyV4sB+y+0RApj+nJWGpzU+/JS8sI1sGBySX+wULUC7A1kVrGw/rmH8J6Lq
         njdtM+jVY4d4dBpoPk+9jxvLpYeqwkCypmTrEbGR/CnWnVAbJTjjZ9OUsPAbQRWDS5ij
         vhptF4OZhtbrySYqM5+4kKXiSBYLfIucOu3+bqPY3dWX9q/khXJLcCuZXO+HNZpiO7Ee
         UgOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6yf2ZD9aZdxpsZfYRw8m1MM2r5zL8kLaUjZ1gmee+FU=;
        b=fa21gC94jzT4vH52Xiflm31xa6B00z7/6238reDPyyT7Bgq5+vhp6bejXIBYc8jOvp
         Hpq6z5oljeZpERV4gxNA/rm+6+WHYpLYw0cM2Fgc0kpox6y/a+2h0R3rZa/5z+D6abns
         zSXTs08TE5+XiVAQjXF1fnC/6AYe2yEZkWwDHJfZc1b8VLdz2jqR6I5AVaYANxFsk8m4
         sSqT3ma3ncKntpBiGDCuXc2FBqCd435kRjnYCECRL8W9rTK7bPK1XWz5nFWGPt3wPg9d
         fDn/JkDfnlPVc31Zrm/hv8vcJnDEdYwhNjPw9r/NHLbyfFr8L+vaMTIALpsLFaSRvNMR
         l4Vg==
X-Gm-Message-State: AGi0Pubgyp8nQI8oHfqSU33okHrXpAfTMSVJgSPEAZgwRg3yiaVP0pUu
	7m0Vf2ydrqVR8ej6IRFt0rnggzoH0oORuTxIfbsVTPG5
X-Google-Smtp-Source: APiQypI9LeRIH78tDjy3p+6EnWXMH/PeGc8dRkzlDhOdXUb85/D2okYlbRjOMcEQhibh83+LWWteAvRB/0Q0WHH5uzE=
X-Received: by 2002:a2e:b8c1:: with SMTP id s1mr9910105ljp.0.1586755298501;
 Sun, 12 Apr 2020 22:21:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAP71WjwuQWL9Efja199LFO6BORe0tT6DYyKP1ntqj+taFWdPEQ@mail.gmail.com>
 <20200410174148.GA28574@kudzu.us>
In-Reply-To: <20200410174148.GA28574@kudzu.us>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Mon, 13 Apr 2020 10:51:26 +0530
Message-ID: <CAFA6WYNg+_u0zX8YeC6iVM1N7e0zbqgb-jqfxnFs7X6DB-QOVw@mail.gmail.com>
Subject: Re: [meta-arm] meta-linaro-toolchain transition to meta-arm-toolchain
To: meta-arm@lists.yoctoproject.org
Cc: Linaro list for OpenEmbedded topics <openembedded@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Apr 2020 at 23:11, Jon Mason <jdmason@kudzu.us> wrote:
>
> On Fri, Apr 10, 2020 at 06:05:57PM +0200, Nicolas Dechesne wrote:
> > hi there,
> >
> > over the last few months, we've transitioned the gcc-arm toolchain from
> > meta-linaro-toolchain for master. Since we are approaching the next YP
> > release, I would like to remove/cleanup recipes in meta-linaro-toolchain
> > before we create the dunfell branch.
> >
> > as of now, meta-linaro-toolchain has the following recipes:
> > gcc_arm-8.2.bb
> > gcc_arm-8.3.bb
> > gcc_arm-9.2.bb
> > gcc_linaro-7.2.bb
> >
> > including all their usual dependencies, and the 'external' toolchain
> > recipes.
> >
> > meta-arm-toolchain has
> > gcc_arm-8.2.bb
> > gcc_arm-8.3.bb
> > gcc_arm-9.2.bb
> >
> > and it's strictly the same metadata, as of now.
> >
> > As such, I am proposing to remove all recipes from meta-linaro-toolchain
> > master branch, and require every user to transition to meta-arm.
> >
> > it will effectively become an empty layer.. so I have 2 options:
> > 1. keep an empty layer with conf/layer.conf
> > 2. remove the layer completely (e.g. remote meta-linaro-toolchain folder)
> >
> > I am not sure which one is better.. #2 will generate an obvious error
> > message for anyone using the layer. Maybe that would be a strong signal..
> >
> > I will default to #2 right before we create the dunfell branch (in a couple
> > of weeks max), unless someone speaks before that!
>
> I agree with you that #2 is the correct choice (in case you were
> wanting a secondary opinion).
>

+1

-Sumit

> Thanks,
> Jon
>
> >
> > Nothing will change of course for our stable branches.
> >
> > cheers
> > nico
>
> >
>
> 
