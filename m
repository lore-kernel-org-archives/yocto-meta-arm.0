Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA6CF33A62
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 13:56:13 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44479.1772718967340500621
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 05:56:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=mvCKTVZg;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.173, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8cb40149037so836803685a.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 05 Mar 2026 05:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1772718966; x=1773323766; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BDS5rvtx+p2mx5mBpt92ZplbqLVZ43mveSkeEg3z6wI=;
        b=mvCKTVZgZPcN4uEygC0t6ADDB0q8qWrPdkfKaxgclhZIcNKB+YwqLKVAcvPh91D0M6
         0KBNpg4dC/BV6tAqFWQcejrwZdh4+rPPt4/aFRRLRWkjp10UogCw+HgGUXqLg4m/lJUR
         qQqYtKnhImoeJZ/GSEo329EoR1PPppQ9zR6b+VLzwGvPVM9H2OEN3LBaJLXfqFqnLLfU
         YZV+do5Oa+EttCE4j1mjMFf9qEltVPMBdXrFMsqr+OQb6fWbqvhll9GUYk+eOvZ0fXK0
         QoQUZmHB7BpL0B2a3O5Fr58dfekzCSMQaNMUPMevaD4ie/IuR04pKv3xPpOhKgbxq7n2
         uegA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772718966; x=1773323766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BDS5rvtx+p2mx5mBpt92ZplbqLVZ43mveSkeEg3z6wI=;
        b=gOAmBc8J0yrQT6c7nwmveerX1vYU7rdI0j5hEukYmIMHKpDMy123JGb39YWvnc1DpT
         EUCLbV4Vn3w5DKRVguYIXD0dISsWB4Y82Z7QVahKYNikgyXvrReFhqhT6+/Z5IlArTvk
         d4GpEFkgVMAXsSj3J8AnGzwP57CnhkQzDzgUZILP8a591GC2X/VO1VODIjrsC1TmhAwb
         rIETEd+RFaPxmqWFo1RGegp5kq5OM4uQ7dhyOMfCknaa3swBuq+YRPwyG1x33ELNOzjA
         fYrJrRLW2K26EavDL+kok8lwd7tiPxHqCEvSZBwGFJw113qOkDFo9bc02Q3DmA6qWU+o
         HEvA==
X-Gm-Message-State: AOJu0Yxi/HwM1PN8Y0FisH2djWDg0+meRjH23XPWFpr+sZaMRkOR2Zim
	XHaCdWf+gF/dluoKZVqGuO3Vvco+kIf5v/KDjqqJPGtp1PlfDXFVssZYOxBR16l8IRJDGSG8Hd4
	8Wu8=
X-Gm-Gg: ATEYQzxG6loKDSLQtc7RIozjzdVWpENHjkxZQCUnHxWpwZzszeQM/KWt2t40HCtoWJR
	/2LguvXsibLJle7XlFJoIrNMvTKlPo+1ljNwqyVE8PiniAA340rQgfFI2KtfW/2ACreidXirMPY
	kbFbEpdC/EQICaoGdJPq4Eg9dXMZSkes9JmfO5hgwY/atCSYW4g3Vf3LxkI39/N1lv8qNhOUjRO
	r23TvD0wpI/ii+nFpLytGROxMqV6a8B7EWrb8k3qaK/U0Lx3mODlW/henmcA+n73wh5PGSAtQE6
	NEn8RI8V0cn4OxBv4zQ/zRSfRU2ClZaFa5ugDfHo5q2jUKxi97kPPZ6gNLHV1XnjvhrsSJpQTPU
	Kshd7cy7yMZYOmuWj8fR3gpOw7LsNtqrSUOZw8YevIPW2WI7FpueZIIhPoGUWdLTqOrn3Stl84d
	pv7fYZtgLkIo6B
X-Received: by 2002:a05:620a:1918:b0:897:56e7:6aa3 with SMTP id af79cd13be357-8cd5afa5bdbmr630902585a.56.1772718966009;
        Thu, 05 Mar 2026 05:56:06 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf66f31asm1836594785a.15.2026.03.05.05.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 05:56:05 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Clement Faure <clement.faure@arm.com>
Subject: Re: [PATCH] arm/classes: fix quilt-native dependency
Date: Thu,  5 Mar 2026 08:55:51 -0500
Message-Id: <177271895366.2989959.16200991096929507932.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260302160852.30229-1-clement.faure@arm.com>
References: <20260302160852.30229-1-clement.faure@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 05 Mar 2026 13:56:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6941


On Mon, 02 Mar 2026 17:08:52 +0100, Clement Faure wrote:
> quilt-native is required by do_apply_local_src_patches task.
> 
> 

Applied, thanks!

[1/1] arm/classes: fix quilt-native dependency
      commit: 46e0a21bdbe72309368f1394c2a39a356ea80686

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

