Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web10.8932.1589384831094805471
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 May 2020 08:47:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uSpBtJfM;
 spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id q10so148190ile.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 13 May 2020 08:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Xfh0TP3iQ5PnjjlMoS3+xy95e3O6pMB+JD0OYNeXgGw=;
        b=uSpBtJfMSFz0eNA423IhJyJ1M17dtMbqBNcXoMxxc3BwiMPsmEUpR2mdZPvlYckEiy
         1HkxbiGVNKIDRD0BP2nWS8XoYrY3iZqZCi7lghw620GkwItntdZ23+Z5SV+XFV6jTp45
         wyR/BpLtOox34skv9/khjaDNM+A+hEjCaM1OaB0Zza3n8kcqgn8lo8oiFQD80pNk0LU1
         KIyeiJUyhVTGtRMTVFfPJ1np0L+Zfk1aiX0Eky4O0yMbF6NI6RBOeuiWmCYPyEMfzimL
         CGtPnLD8ZX4jKnnJ4riA/MaRGcSfNznZKFcEN/efLenk61WWOydJ7BvQD3mkozTA4LnX
         kWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Xfh0TP3iQ5PnjjlMoS3+xy95e3O6pMB+JD0OYNeXgGw=;
        b=SKX2w94nMaTPzGKbAlqDJT1J7Pr8WFBjxQwrlIqdwpxBIVZGAX4Yg1y6rbiZjszSGp
         3/cCvibB8Uy+/r2UQ0wM/+kazmHJ0jel92AWTMbNdwfSR04OTF/CR9BAkUGs58Njoc1f
         zoBVmMtmkUi2Cu+CfmesRKWj98tr5+EauUd7ZZ7IypE0G4BCcrEZKx8xCzuCJhHPfODG
         AZnjBkJLSTeXuiICSHR2XXwKYHNEs0xZ7qhsiAfYfFImCUCjvkKFx9f1g2ReP47YEmWi
         vzATW+QFeCUOjLPTmOpejTQOdwsF0PoGU86Zi7P7JSDy6JZLPUnitDCbg4qoNwe3hkTH
         XusA==
X-Gm-Message-State: AOAM532dvE6uRtHj5flq5OBLUyWqtq/a+crQ3i1rKXdWjMebAp4Q4MJG
	46ZhBn39UCcup9zZXNoRKgmzC+leqlM=
X-Google-Smtp-Source: ABdhPJyrrBDVNklLPBFiRdPqLV04P6OPkOUygwbLo/reASbvukZqrXsSAFSxwK19KtxNZw+FxXpeBQ==
X-Received: by 2002:a92:5e99:: with SMTP id f25mr124170ilg.0.1589384830178;
        Wed, 13 May 2020 08:47:10 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.garmin.com ([2605:a601:ac3d:c100:11af:b72d:1039:51ec])
        by smtp.gmail.com with ESMTPSA id c10sm35412ioc.24.2020.05.13.08.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 08:47:09 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [meta-arm][PATCH v3 0/2] TF-A Improvement
Date: Wed, 13 May 2020 10:47:05 -0500
Message-Id: <20200513154707.33747-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200511142604.11860-1-JPEWhacker@gmail.com>
References: <20200511142604.11860-1-JPEWhacker@gmail.com>

Makes several improvements to the TF-A recipe which should aid in it
being the canonical source of TF-A that other BSP layers can pull in
instead of replicating the recipe.

Joshua Watt (2):
  trusted-firmware-a: Build out of tree
  trusted-firmware-a: Install .elf file from subdirectory

 .../trusted-firmware-a/trusted-firmware-a.inc | 32 +++++++++++--------
 1 file changed, 18 insertions(+), 14 deletions(-)

-- 
2.17.1

