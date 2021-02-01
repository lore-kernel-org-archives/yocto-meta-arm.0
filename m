Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web09.36933.1612198298526623625
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 01 Feb 2021 08:51:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=UfThqFNb;
 spf=pass (domain: burtonini.com, ip: 209.85.167.52, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f52.google.com with SMTP id u25so23670865lfc.2
        for <meta-arm@lists.yoctoproject.org>; Mon, 01 Feb 2021 08:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3wDhO4/Ddxm1zoTR+Tj4q/xeEAD+34Y9qB3kcOEw6DM=;
        b=UfThqFNblnpi23sAqX9qLdYZm008p0tG4HHzz9HCwbBEEgwTqd/EDdTCKrvrWdLCOC
         sjlDTxJ76u9rUwf1FrSdbaPbJv/4Nb6f6CeTcZ4gGgurdCwNkfFh9IkLwFYp3PgCchg/
         3/5aGLiIH6YgutvVXux7lXDxZap4gN+1RXOqa31H3denx0ibfne3UW/EbujzEpQIlF/s
         5HFqpnz8wENhMamege4DaHVdcVhHWBXNU1q/cmV7scln/UgDnMOBX7KCIpige527r3xK
         rJsiD0drkFA0AsfCvcY+kEKZWXrAKN+KISVmsVHktqAk1CmTpfPGVf5YUBWk5FD1rmeC
         m8pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3wDhO4/Ddxm1zoTR+Tj4q/xeEAD+34Y9qB3kcOEw6DM=;
        b=Ahty5PtYkTii4rti07AZ64w3O1GmWkC3BxMqgClMl5xN8LuXuVMgWGD/mr63OewyNP
         3jw6V+6q8a8ehssXvV/ozIW5np5R1Cfe0SUxwYkPnYPev68xElhZ34qhvILwHfN3f9M4
         svL5PYnHzC8+Zh1q8h2ayjZLubYBAMexyr5qfmZhmPvpualPtVQkOO38UPLlPn5q8IF0
         tvPYLa/T7/qWWk3RILd7UorEaq84pBqCCQCm9mgjTv/diaEiDu+oycQ643bsX9jSa+UI
         USKKdVKgPJyp9U04V1205+FPPf0XnT7EKpSDQAG4lQC3IVvn4icVOOzjHMyrgsw1KUSz
         DZHg==
X-Gm-Message-State: AOAM533GQDu/fitv8Ez6AaBhpVi9WdKAgSZsGoxo9T7xtfm7HB4rrHTa
	MkI9bKZLhg+qzCULEIaKHyJZo8IirjYvP43LqFpBsA==
X-Google-Smtp-Source: ABdhPJwU6N04aDUFIfe6kgW1mvRxkLVTSjsYyvad2knNVEZGgYpl4mmchbTJkz1Mdxc6Ekri70ltS/oeZqkDPK2eRRI=
X-Received: by 2002:a19:d07:: with SMTP id 7mr8784721lfn.215.1612198296604;
 Mon, 01 Feb 2021 08:51:36 -0800 (PST)
MIME-Version: 1.0
References: <07fa1f2131b65ee369e8f02ae287b1ba8d0b01d5.1612185962.git.diego.sueiro@arm.com>
In-Reply-To: <07fa1f2131b65ee369e8f02ae287b1ba8d0b01d5.1612185962.git.diego.sueiro@arm.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 1 Feb 2021 16:51:25 +0000
Message-ID: <CAAnfSTurewK-hEUQFMg6RG7bQ-5wpyM_-qcKhdVgkkaaa86njQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] gem5/gem5-native: Fix INSANE_SKIP mechanism for native-last QA check
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

As this fixes the build, merging now.

Ross

On Mon, 1 Feb 2021 at 13:27, Diego Sueiro <diego.sueiro@arm.com> wrote:
>
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> Change-Id: Ic1c92e145694abd30fdd99fd073eeacce917c55e
> ---
>  meta-gem5/recipes-devtools/gem5/gem5-native.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-gem5/recipes-devtools/gem5/gem5-native.inc b/meta-gem5/recipes-devtools/gem5/gem5-native.inc
> index 3c891ba..3cad1eb 100644
> --- a/meta-gem5/recipes-devtools/gem5/gem5-native.inc
> +++ b/meta-gem5/recipes-devtools/gem5/gem5-native.inc
> @@ -18,7 +18,7 @@ GEM5_SCONS_ARGS ?= "CC=${BUILD_CC} CXX=${BUILD_CXX} \
>  GEM5_RUN_PROFILE ?= "configs/example/fs.py"
>
>  # We are building a native package and we need to use scons
> -inherit native scons
> +inherit scons native
>
>  # the build is using several tools:
>  # python3: scons and six
> --
> 2.17.1
>
>
> 
>
