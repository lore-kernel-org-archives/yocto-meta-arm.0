Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web11.1484.1602691129476017096
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Oct 2020 08:58:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=ejC6CFFE;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.41, mailfrom: jdmason@kudzu.us)
Received: by mail-io1-f41.google.com with SMTP id r4so5894852ioh.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 14 Oct 2020 08:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=c3k9vxt9Z0403G2YWjpI59gU+JmY2026CR2UeibdZ9A=;
        b=ejC6CFFEUHMUZS9Z0koUq2428bn3191ggTNQaJhUxbAjmcW4qLnc9+Ajn6Uc5vsNmZ
         HPUqs80SVMh56W8bQRoU7FZAJaHWr4KfN/HG1tFdcmQ+11oM+O8XkaIRC0jjXpas7DWX
         MmpTG1koZwZ4lU+tIU5F4p3ZXnSApyf1ZxiopKQFvAe+fN7aguQmmu8k35e4rGmVyZFQ
         iwC5lQyv4WWoZjI7hdm3QLUFO0QXf07pmuJFlfV+3Qrxy57wrFVNT3j3BunSbLLaWDit
         fqHGqZA5BZ71xiKW7dupRJpL89Zaqa3mOvZAl6fJdJ+V0dDH30Op8CZjGztVNVmbfq/q
         spTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=c3k9vxt9Z0403G2YWjpI59gU+JmY2026CR2UeibdZ9A=;
        b=OGicpYdIVeYgPc1bYC0vwIpGMJGnxh090njl4+x+++ddE8mDHF9QnJcPd7RgaQGECF
         CaC9y89tyfTeALuFWSdgM3sGraS4+6FxyFNXfwRw6aTbccvvjO10OKZ6T/BgmGn81f12
         b4WozmpJ6lGt/dyFtmnKzoFJXp2RpLchGMB9+E2cV54ZS66f240QegwidUt0GnqVVlVa
         nMgq6OPsyqeXJMoeEbgxJe7GM+zEve3dNeeLtc6PI27W9ZYt3Wt1OqKluKLj3ltyUgsQ
         JpJRQGBHCKVFvshaL9XSebXVntpM+owcVfO+0QlME/mE0cf+fi9+J0LhpjAoPTRpVtdd
         MCkA==
X-Gm-Message-State: AOAM533jRBY0F8MEpo1DjOLd4LT5QKNvDkkyx61TrRMtDw9TzjqrIX/D
	e/iAkbzdl5HZ1jUH+sRV4vS5SX1qgulr+biy
X-Google-Smtp-Source: ABdhPJxl7Xkns3GVaOfz5zvUSyCCTWcN7cHaaX2QEmA1plndF8LGSrv1xiSv88Rl2c+Iidw18O9Wlg==
X-Received: by 2002:a05:6638:2395:: with SMTP id q21mr117705jat.94.1602691128596;
        Wed, 14 Oct 2020 08:58:48 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id e13sm3154604iob.43.2020.10.14.08.58.48
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 08:58:48 -0700 (PDT)
Date: Wed, 14 Oct 2020 11:58:43 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm gatesgarth deadline near
Message-ID: <20201014155843.GA15458@kudzu.us>
MIME-Version: 1.0
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any new features that are desired to be included in the meta-arm
gatesgarth release need to be on the meta-arm mailing list (this one)
by 23rd October.  This is to allow sufficient time for reviews,
revisions, and integration prior to the expected release of
gatestgath.

If this is problematic, please contact me.

Thanks,
Jon
