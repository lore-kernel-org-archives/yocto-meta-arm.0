Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web12.912.1592850149593678917
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 Jun 2020 11:22:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=DmbIC8IO;
 spf=pass (domain: burtonini.com, ip: 209.85.208.195, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f195.google.com with SMTP id z9so20434827ljh.13
        for <meta-arm@lists.yoctoproject.org>; Mon, 22 Jun 2020 11:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l/o1Q+rdgJWtKy3DeECucX29+8QgyBXDyYxtDfQX06I=;
        b=DmbIC8IONuBhqL79HXP0sxor7hiSTXYSlYnf99kDVWxBfgSiXQ/98fh6lUiaadqSQz
         SKavFSSOlp5A4zFp7hnxozdhRr5+KLJojA3mF/3kOwSx4tk9vmUFBDSaGn4GulEd7HI5
         Gz1rvJyBkApWglCrgqKIGlmkl4si8vdoxVxMfUN97CTKCI1STKK1fjWkx05rG1JRQ1uH
         rmNcnd9fKXixLcDKp85sKKVXleFz0XgDylajZLuZqD6pIFu5bt2/UVXzhZL2cDwyoqbs
         VF89D0u0uig9lZjDQArSXyXkJOlOwKhqT/BRUZIJIc7tAsMzX7l4DOg9/f5Ka0xfPKE3
         hxag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l/o1Q+rdgJWtKy3DeECucX29+8QgyBXDyYxtDfQX06I=;
        b=fh+VwXghxh5pHmygSiGpuQw2hM4Qlg4slj5dGnOB5nVxSv2b6VBYPHzFMY4rxj0BFL
         Sg+ZRiiZpuX1FPDUmdjcyrfYCY3t8oJVbbsn2mXhBNeXPyLHMcBE/X6hXLM+ITYddhrF
         lAFm8mBbMHKhosHPLpNZtJ2fx7wU7zEHu7/UKct2SMQyDmldB0zv5ylH+72wU6vmFTiL
         2Y36J86AbMDKQn+iUjUQI41gzHma4opXFOaEf8YtIMVwbit/zyoA1XH2qgze4aaNR7Iz
         JyVFcqTIEaLvPQsQMwUYkRHOa2qaOxsocrP6cu399+JSzbt+ctRcsp1OLb1KOq7f9ZQj
         3/aA==
X-Gm-Message-State: AOAM5339I/G2cwVENwrC1LsHDOAwbxq+Zgj2JdzSIpQrmP6ZXJe3Cmzg
	mWqMTWUidRSFMPMGSn+YfbXbzw3z16icm90vl7hKLw==
X-Google-Smtp-Source: ABdhPJzmpWBUgurJI6HTekF1bOf/jHBF7U4Mj9hK7DkHnVztqNqQ+urGM/oRuEXkyynSlZAJu7Lz0yu2MlPnzUFlmAM=
X-Received: by 2002:a2e:a0c8:: with SMTP id f8mr8680361ljm.352.1592850147705;
 Mon, 22 Jun 2020 11:22:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200622071401.2570-1-gabor.abonyi@arm.com> <20200622071401.2570-3-gabor.abonyi@arm.com>
In-Reply-To: <20200622071401.2570-3-gabor.abonyi@arm.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 22 Jun 2020 19:22:16 +0100
Message-ID: <CAAnfSTvpWeYMN-X8csZLBqsgHtZbu0XTvuG7QTdW-44BPoGeMg@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 2/6] arm-toolchain: armcompiler: Add Arm Clang recipe
To: Gabor Abonyi <gabor.abonyi@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 22 Jun 2020 at 08:15, Gabor Abonyi <gabor.abonyi@arm.com> wrote:
>
> Adds Arm Clang recipe to pull down the prebuilt Armcompiler for
> compiling for Cortex-A, Cortex-R, and Cortex-M processors from ARM.
> This toolchain is required to build Arm trusted-firmware-m with
> different optimisations than GCC can provide for M-class processors.

Required to build tfm, or optionally useful if building tfm?

Ross
