Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web12.7149.1592399463290630979
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Jun 2020 06:11:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=m/L95SLT;
 spf=pass (domain: burtonini.com, ip: 209.85.208.195, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f195.google.com with SMTP id 9so2771795ljc.8
        for <meta-arm@lists.yoctoproject.org>; Wed, 17 Jun 2020 06:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YHg1ojO4Jas7NVS4Re/bFkUZ/sNM67elgi9cPdDTup8=;
        b=m/L95SLTeIRbJOB5FoirwwVVta/E33nNRShQ6hkGpgU5L3u9NwBxXVG+CjboOuVAC7
         E+2NnHw0EPMHUbrw3o4ZnYRqIJgc1loyt+MtTaakytCOIm6mI8bf1XeNC4qL216QuWQM
         wGLcLUWG6GXSNQyMndgAqD0xWj81M0fKDJzhRQzIQUzqnuamhZwQi59uaX3qdMKysgfU
         p5LgCMlNNqNUC7FtH/u/MxdLdmFlfdwvjora5RvpD/cRrpdG1Rr6X3dXnQarYHdI3G5M
         9HYV3LirDg27U9fzKrT3SVB3ooVDUtJfAAVc/cO4pmWGfXKdO32cVBSE08Xoy0la3CM9
         3sBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YHg1ojO4Jas7NVS4Re/bFkUZ/sNM67elgi9cPdDTup8=;
        b=d/gaCYsZ3CAmrfVfMIVCAtxvPkbpARMH5a+G2S3mEzUcnBkoGcDZLta3//avD1DiUl
         4RT9TmGhPm/wz5NWyywPJCIetvl0LDb4RNQWWykGDkHOk3bB7gh7jAjS+BvQcHGPTjp7
         KUK6YOUq39MFlY7oEcnljoGRpAP+dy9JS0rxehuacdf1ixtPhMBDv1DEpxPrEM3om3a4
         eslp//vdDHe+JZHncf1ZY0c3VNI23q+sXgrHPZSLePrFWovubgXezBkcF7I++GjEKg6H
         HoEMn2sodg0Bmln+TRSK8HHKQSFq+wxIVwVrvTjLy/0luB7T0GuCJXoZzsSYjEKz0KMd
         zwYQ==
X-Gm-Message-State: AOAM53316IRbMrCCUsBen8vNqiHxNSN2pG6DOfYhL5m+HfowSu88MEcw
	W43Zd+c2OdkrNmn58BDKI+LQgpTVvyTRFT030lxnAg==
X-Google-Smtp-Source: ABdhPJxiriSzplfpbNtJkAEF66epqrQxzJRkHDODzugrs946gc41bUP0h3IJYw04EILRoLXRyCpLFaNQQD7hYF+OXVs=
X-Received: by 2002:a2e:9dc2:: with SMTP id x2mr4278747ljj.22.1592399461466;
 Wed, 17 Jun 2020 06:11:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200616141404.1046832-1-ross@burtonini.com> <20200617121504.GB21297@kudzu.us>
In-Reply-To: <20200617121504.GB21297@kudzu.us>
From: "Ross Burton" <ross@burtonini.com>
Date: Wed, 17 Jun 2020 14:10:50 +0100
Message-ID: <CAAnfSTszZMHhS2u0XL_zAPs_OvmYOqzSWYML9jEog_FgXMuC4A@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 1/3] README: add Ross Burton as co-maintainer
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Jun 2020 at 13:15, Jon Mason <jdmason@kudzu.us> wrote:
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
>
> Who are you again?  ;-)

Just some random person.

Ross
