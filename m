Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12498.1794580190048253576
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 Nov 2026 06:29:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20260707.gappssmtp.com header.s=20260707 header.b=FCClMOHH;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.172, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-55b8cd4e2abso8363451cf.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 13 Nov 2026 06:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20260707.gappssmtp.com; s=20260707; t=1794580189; x=1795184989; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJhgWO+Eu/bGkpooABreRvTBG2Wo56Gz8I2S5TeUTHo=;
        b=FCClMOHHVyJ7Y6GotjG8IdcbP7ccTf19RmzYD9RrxfqjmI1w1UH/lw5BrH6HtfF/ot
         zKhZvF0BKL4MduBXzVE1f2Ju0KA7FjRHEnTV0eqJH7LGhU2cez1FNgu//ryZB2oLSR02
         KsNvMeXOlqhzzhOr/4XphAIMS3gAemGhZhbfiQrjzqOzO9OeIaeOAyzVjj+unM9eSp56
         E7PLJSZTwYAeroSJ9qmWMtQWzdcrTIEZnyWqWZrwQ4li5E5yPaxf3exAS3NWFU/zEQQF
         UEK4CaMRfFNjLEIn9rhLbCxUlMJJ6PVCSg58GTnP1IgnqV2Dq2I2o734UbK7JVIVh2N2
         jZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794580189; x=1795184989;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sJhgWO+Eu/bGkpooABreRvTBG2Wo56Gz8I2S5TeUTHo=;
        b=WuUIRLdsOCqqHgmrkzwp8t4fKd0hKRI/Jne052Tc8Mhw7rTiBtekakwl5IB4b2HAmM
         Z2fSlrjhsRS6d482+MrXypFtnU5mW6Z9k5X7MdHtJ5lLZoo5JB6xicoCyaCpw+d2gxhh
         GbC8Ev/yUyvB/5Ze6azFQTKB0N+dL2TNQ5E3/zKptkNbXks8Vb0L2XyPRLysDPR54KDi
         kTeVw9d8qtEp7w+rGJsLwcNf5TC2onblb27QFbNo3OCPizVjmqCuhAaLEUaLKAiEMgsC
         k+asOLs2HLABYNrAuWnWNq8FANRYfpiprE9en0LH7AdU/rlPf84IWFNV2IQ3YfJBlmF3
         fsVA==
X-Gm-Message-State: APuU4Z8a/k557it5y9MikBAC0+IGvguISwiDIFu8+zy+3MCnT2TTmg3V
	AnC/iJvWrPFsDFhY+d90hXIVY6NbWvcbCQ6qOE6AZ9usVd276C7Zg+qflRSFY3QM1L4ZJSqsm2C
	XOqo=
X-Gm-Gg: AYBFou1yW27P0uwvOc5Yff8V1O2z+cPI2By+tDUHcYQyJnFvZ07SNjdWw55QtjGFY7O
	8pFNggfUy/Ih3ydYr1lp+j3Lton+8/6NPKVhmv6ATmCUb9tDyNzLWaAVHJuu91azLX4aVQMXd7q
	G9qwUFyAVMutvRXf6KUrNHpx/phc3E9kQutzwWSwIlUZazf+3PKxleNHqir2v4BngjjyltmnNbT
	QN/uGFKB6OzwVpqfRJyyRcOKRUaxdzP8vnSjax4APl/mc8SkQ+k7QfznZDXklvsVysTFjoAZIza
	czLZM9gSvce8kHsq0hwVIq5SP2IX+vAvFJTP+KKanaJdXkH6PpXLZwuM27n0IQVNKG0mrcss3JA
	ijU7Ws7GNZ7I8mg5GK8HsPJtT+gVHSfh6qwJwDyFb1JtFAQy5KBlRBg5o1OVDycbGWUaD4EsjWa
	3uqvE4FrP9mt40yztLJpQQD3hV6/H/6rlih70jD2ucr94E8rIzcrcE/oNGi/vmGEUnpU+13/1+a
	Lan1IedrGBFtkuYfeQ4QEh2QfepBKDjN/AfIexjLaZidiwk72oCxv05wMN2AB1UVd3oOTv6hXwQ
	CqOOwUT40JG/M4E/MBY=
X-Received: by 2002:ac8:5cc8:0:b0:538:689:553e with SMTP id d75a77b69052e-55ac7e48df5mr42699371cf.42.1794580188880;
        Fri, 13 Nov 2026 06:29:48 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad0ffeb7fsm19271121cf.18.2026.11.13.06.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:29:48 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/3] scripts: add release management script
Date: Fri, 13 Nov 2026 09:29:30 -0500
Message-Id: <179458017084.2164217.8671508590708437582.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261110191406.48308-1-jon.mason@arm.com>
References: <20261110191406.48308-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arm@lists.yoctoproject.org>; Fri, 13 Nov 2026 14:29:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7220


On Tue, 10 Nov 2026 14:14:04 -0500, Jon Mason wrote:
> Add a Python script to simplify and consolidate the meta-arm release
> process, replacing several previously used standalone Bash scripts.
> 
> The script supports creating GPG-signed Yocto release tags, updating
> existing release branches when new commits are available, and creating
> platform-specific release tags. Platform tags use the existing naming
> convention and support specifying a release date independently of when
> the tag is created.
> 
> [...]

Applied, thanks!

[1/3] scripts: add release management script
      commit: 3f2c662098fed3e49151ce09455e23451a0c56bf
[2/3] scripts: add utility to identify unused BSP recipes and patches
      commit: 108aeb6b7155e0f26c38a25f9342a34bbd36930c
[3/3] scripts: add utility to track patch age and upstream status
      commit: 37d1e093ef937563dd683641ced87f44fcfce4da

Best regards,
-- 
Jon Mason <jon.mason@arm.com>
