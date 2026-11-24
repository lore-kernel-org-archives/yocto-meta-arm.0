Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20064.1795533316591908383
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 24 Nov 2026 07:15:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu.us header.s=google header.b=McBh7v+V;
 spf=pass (domain: kudzu.us, ip: 209.85.222.172, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93f20b304c0so432852985a.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 24 Nov 2026 07:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu.us; s=google; t=1795533315; x=1796138115; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PXKmiV5Z1aYgZlovsYax5Zu3CPOIHbnKnwV+CLh57Dk=;
        b=McBh7v+VvxfFBNNhMLF9JXLLI+fg1pMt8XSjTOpgZ6hryGlR6Crp8bfYn8JDLvDPuX
         RsHgVGS8RRuY4ybLVFAEGoDRQ1cBlwE33X9GIueRRU/3lpNTuWXvijBOXPUtVgRtkXHz
         vyd5E/LRFXUjOJv2nwiPM6CnjEMoy5xqVpSdoodNQg/MfQ8+6ge1kKwln1fagsfqX88l
         9U9HUwaePFVTUqCoHnSKoqCyujbUzpr5h1mVNs9i4f8cDkoB9pSWywZFjGAmQPX1r3nS
         QHk9SFR8xQ4APqjMUi7HVNQU0BRJ3AXdUlFt7SmSlHRTniDxDoeGXbs9fdtUMNQGOrH+
         Kdbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795533315; x=1796138115;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PXKmiV5Z1aYgZlovsYax5Zu3CPOIHbnKnwV+CLh57Dk=;
        b=FAA1tRGHRY2oNr4w0lifeOZKT0Hpi6taOL8tDkgFWdtaDTbm/FfN+3CeJBeQvxfFMh
         FmWdt07dmFwf0q3ks53ctCn5p7mkpSiumNGt2ld1uwg7fK6oNJnW/xHN+8a0k1eEocLL
         lG0XUFQHX1uGNLYeowRlZhbvl8u+4sCPJK/t0mPrfC+S+r9QkjSedGKGY8yjcN7tKVaM
         rkUagikI7HnBEXE5N8P8z/oXqP/hlFqpkq2qJGnksSxNlnSyQjyqlCP6nUkKYMdkq+9b
         ZpoX7E4j3uvCmmcJmKqkJw15gm0tTGn858RzXbGYj5fUQ7nYXytoeiAXNoV86TyjIDUY
         54jA==
X-Gm-Message-State: APuU4Z/Y5nsBcfo0+632pqpUhqgHyF/Vo7xTdE/RyM4CdJUHx971MW8p
	SFLvEztJm4hLJCuojxT7NBlS/4kytwSLFTbNAYdGpUgm0NQA3Ve+kOYv6SDn6Uaa0HVPPL6Cq7d
	XltU=
X-Gm-Gg: AZFdTZdRQ5Gfd91yyIxtsYYVKGfeiQRsTfA7r2ZlWKl5j44AZCWSRKZdycTzX6ZSc2N
	9GkrI29A585L8an+DaMGZu/VTxh8CUecqdmu+U3RcEjAIZxIOydUa88fL+5c5OqDJ83zSYKZZ+n
	vnPxaJh0PrJnoN08JIFKp3f1zKv3JSLYABcZVWn7k+KPNmahgskunkelUw7qy/FK9HXfebpiDlk
	TRankXCR8zH1Nw5j6+bfauT2UADcgisphMAWGmPw3v9w/bfj8Ncke53WC1qEXs1c2lBgszUv2xY
	VI2YlCYrxMT3BoaRbVyADJqBBZMeL+Nw/WiWnoYTIJz9o84CkR1U4TrJzUOy7XM3ftUW1GpCMQy
	2I1soVGIRTrH/kgWMz/Idy2W5hZ2pc4Mt+R2bSNfGBgBwjBDd7bSOW3OLP64aZS//kE02ULgUhI
	vPoxFyL2ytYAP8KmDHTjCfxg75WfCVZ902Ic12HjWfRs0A1ZbyXHaa+v/I1BtepuleLX2/Ecd3U
	Wf2H5WEPHAFbBVSZN433W4gRvb6hUUH4as291cR3JIlg6JaVgtVTfaZe8YGUzlgBp9rGpRpp3R2
	vIjUyOpytt7e+r5ZywQ=
X-Received: by 2002:a05:620a:170c:b0:949:7502:696 with SMTP id af79cd13be357-949bab33006mr2880015085a.72.1795533315368;
        Tue, 24 Nov 2026 07:15:15 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949caf98d34sm849708985a.2.2026.11.24.07.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:15:14 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] arm/oeqa/fvp_devices: use http: instead of https: in network test
Date: Tue, 24 Nov 2026 10:15:06 -0500
Message-Id: <179553330630.3353818.8821536648440840260.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261119173734.3314029-1-ross.burton@arm.com>
References: <20261119173734.3314029-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arm@lists.yoctoproject.org>; Tue, 24 Nov 2026 15:15:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7225


On Thu, 19 Nov 2026 17:37:34 +0000, Ross Burton wrote:
> The network connectivity test currently does a wget on a https: URL, but
> in minimal images where wget is actually provided by busybox this will
> pipe the sockets through openssl, which might not be installed.
> 
> Instead, use http://www.example.com/. This doesn't redirect to the https:
> site and can be fetched with just busybox wget.
> 
> [...]

Applied, thanks!

[1/1] arm/oeqa/fvp_devices: use http: instead of https: in network test
      commit: 2d6e43e48d5c3c8fc3578440f793b17a646290ca

Best regards,
-- 
Jon Mason <jon.mason@arm.com>
