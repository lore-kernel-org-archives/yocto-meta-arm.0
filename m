Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C038DC38A2C
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 15:41:15 +0000 (UTC)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
 [209.85.217.43])
 by mx.groups.io with SMTP id smtpd.web12.7892.1649344472364797498
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 Apr 2022 08:14:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Fs/ggc9U;
 spf=pass (domain: linaro.org, ip: 209.85.217.43,
 mailfrom: ralph.siemsen@linaro.org)
Received: by mail-vs1-f43.google.com with SMTP id a127so3940854vsa.3
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 Apr 2022 08:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=/bIv4wdxDQoi5Us1b7QRGeCvnYQqY3LlwYNw5zpFDz8=;
        b=Fs/ggc9Upl5QaKQQGR9GTKlhhCe+Wgod5cUjsHRY5b4e+PpLyrDyvWtEDXOTHyA7Uz
         a1pHsfHlUspnMEO/ClSFOxtNcrGybinGWqzlt6ZsGzQXoDaOwd1EOl+KhdoN2nkLdoah
         IsPqRvXt50AA9WZZN6xs78Zg9AZLUZdIwogISvPF7AJev70jl3+c0EFN+xWOq2C9Jc4H
         bV+5fVRG3ByB6YKT2q3U8qA5Ki9Sy2l2jfqcTS6bmIFeKtIENpUXSPYIwnGuB5kmhuw0
         HGbdUk3RqtFa1leOkOCt+NpvhB6DI/sK4oT1QuLekxXM7Qp6t6574mPoX1ksHh7jFhRV
         euWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=/bIv4wdxDQoi5Us1b7QRGeCvnYQqY3LlwYNw5zpFDz8=;
        b=ujCgNSMLx/wAFakPqbHaZFs5rVhy89Gio+IKPHa25qUC21+1tFscKx8DfW4XPrl5jw
         seEAlN0qZ8OzOumAsJ+LnuMstUc5wRD5agJOZcjAjxlwhVxamcZSPlR5hG9hmzjvMPGy
         KsRQqFSnskyptlqarzKMiAucIAissyDW+EV5RTgkCw50XDB3YEoilVVPamTWsOFJPhYJ
         vNI9qCuNXLRt8h+/x6MO9yHiU7UZWC07OO74rfiTtaJM83cA1wsGr1NyyD6Fa6ThSA4c
         sfhFoJ+xCcbDbIUgl0958OepaGapEU5MZyY5rOZpJ2H/KGveEdBJo44FbjCOkM0sWGBd
         hZxw==
X-Gm-Message-State: AOAM530qJtnUjVkMzJJT8ckZIPLHirmWsAQqVjNjWph73xo4M7A5jWyG
	BLI2hzcUltfMTbz/Q/X92TEVxCMMNzhSb8WtjDYtMe8Ndz18sw==
X-Google-Smtp-Source: 
 ABdhPJzRojpAf7xaiZbYMHYRQK5lzM9Jz8i3KTn/QFFUHyQVdGVNir5Ute3hhTje6eUOEInEHrm4oFVqKyTRRnLgUlo=
X-Received: by 2002:a05:6102:548d:b0:325:9df9:b8ac with SMTP id
 bk13-20020a056102548d00b003259df9b8acmr4647543vsb.73.1649344471398; Thu, 07
 Apr 2022 08:14:31 -0700 (PDT)
MIME-Version: 1.0
From: Ralph Siemsen <ralph.siemsen@linaro.org>
Date: Thu, 7 Apr 2022 11:14:20 -0400
Message-ID: 
 <CANp-EDaiKQQpeKqB_tXek5+3arUHn0vm6-DhQ-=QBKxP9+PSwQ@mail.gmail.com>
Subject: CVE exclusions for dunfell
To: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 07 Apr 2022 15:41:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3249

I'm currently carrying (via local .bbappend) exclusions for the following CVEs.

CVE-2019-15847
- bug applies to POWER9 backend, no effect on ARM

CVE-2021-37322
- the NVD reports this against gcc and binutils, but bug in in
binutills (old version)
- the CVE is ignored in dunfell poky [1]

[1] https://git.yoctoproject.org/poky/commit/?h=dunfell&id=22767ef3986a7ac90e7c566ed38044d298a20895

Would these be acceptable to go into meta-arm layer (dunfell branch)?
I can prepare patch(es).

Thanks,
Ralph

