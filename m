Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A098C3DA6D
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 04:23:57 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web11.41372.1747974234291843006
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 May 2025 21:23:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=j45cY8lY;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.210.49, mailfrom: jdmason@kudzu.us)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-72c3b863b8eso6008749a34.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 22 May 2025 21:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1747974233; x=1748579033; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qGCRBFyPK5Hc3tQCco3GhO6wKkmVmzD0K7QUs9STY8g=;
        b=j45cY8lYjjYJpqC77VpkGdkswvm23bdSI3h9MXX8XS5b5H4bLMnU2e30nZoptImORj
         qeXZsdBb3REM1a6bgAgYJDxlkLxHxyv7d/RrDMBcsY5iLQTazrud1x+c4vEV8aUkRwB0
         Oj4DI7khvZ7W6di34wxhOnF7jcWrwqtW6hkvtaR+eCIVweiwG82gQ0dFWv/4dz/h9dkZ
         rzBIq/27hRWThXKHeuyQbj8INOXQ7y9rRyTJ+YewaobqsKfat/1ia36KQQ1fyy5q3cci
         y4fWJEejnE52r5DD5+G+EKr1PhSjc6b4SU2CrYvtqXtxTLAJCwf1BXtOxlK5JeL4Dzh1
         fmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747974233; x=1748579033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qGCRBFyPK5Hc3tQCco3GhO6wKkmVmzD0K7QUs9STY8g=;
        b=uGufHVgSOvN5LIuu401NtUhRoC/hP7yun6lTaBPgfSL07X9AH8qv9uhhzUqUn/yLdp
         lWqWaq28/v1G0I6b61F6r+Aa/I3xI1QmJCLCvGgYICLn7yUKX6kIjNQvDuwzaR7pHuaL
         7v+UGRZS/2DhyRiSc+Ecle21H55loJ3klx5tIea0Rsyt0fI48iY6kU9bufaKQ0iN5zwy
         kcb+vPriZWvjnvEDes59kTeEKqziQU2gkq4uDn/VMr73UdVyqBWmYX16bBvm4PR5K9lt
         J710Celm2dClOt2gkZcYa13OBMFRNnPQUMWG3MY2ILnq04FrmMUTNeWeoxRMAibYzSQI
         jzJA==
X-Gm-Message-State: AOJu0YxNCaYi85/qAzM4FQS9Gf9UwKzDhsO/y0KHDaoWAk79CnAaV2eh
	iWDh7x/R38+i6mOpBdJZaDaRz5/2Ho8f/in7g//GtYgIBlmPNYwxTs9pMsWAy72GOUpqYcEbEne
	6XFqrlQ==
X-Gm-Gg: ASbGncst4RxNvCGyERlTDyq+IcMdvWmL9rMyJNVBGGPM13Lgjz1Aye/vcDVvym3MkCS
	iRXL25U+0iQwI2Oa0E5aMjVO5YdyeVy+GBVjC7j9Vofd1+AbsK9pGG/nYXnKxVmsMfHfpaFln9H
	p8gvLZrK43br2soGHzFUT6wcuXXwWhWNS6aYupULZa5DeRWYwKsa151+Nbq1Tv2FmJ8+QpGE2wd
	jnzsvRvsvzUE2q/3R7T3t51/AqkjadIm5ay24Gyj5JznMp29L+Pd/gJm4me6SyP5IB9CttYg9Ku
	wrl6Gv+NHXo+S2JfIa12Iicr+wAhHy5HclI3VowKBPE=
X-Google-Smtp-Source: AGHT+IESC8d7IpPcpwRyyYxYoVKimNANW/IN1DUXLcKBOHgZNHJjzGAal5CkJZ8ZciMd5AulrbCkgQ==
X-Received: by 2002:a05:620a:25cd:b0:7cd:4c2f:78c9 with SMTP id af79cd13be357-7cee322f4a7mr244559885a.25.1747974222889;
        Thu, 22 May 2025 21:23:42 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467c178bsm1121732985a.10.2025.05.22.21.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 21:23:42 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] CI: don't save all task logs on every build
Date: Fri, 23 May 2025 00:23:17 -0400
Message-Id: <174797419805.2415316.5725647417441833654.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250521162441.3472273-1-ross.burton@arm.com>
References: <20250521162441.3472273-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 23 May 2025 04:23:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6523


On Wed, 21 May 2025 17:24:41 +0100, Ross Burton wrote:
> We currently archive all of the task logs on every job, but this ends up
> being between 2-10MB per job and our pipelines have ~100 jobs.
> 
> To save space and time, change the log collection to only happen if the
> job fails, and explicitly expire them after a week.
> 
> This reverts meta-arm 60abe46, but in two years we've not really needed
> successful logs, and they can be easily toggled back on if needed in a
> branch.
> 
> [...]

Applied, thanks!

[1/1] CI: don't save all task logs on every build
      commit: 9ee6fc270b8785642bfe68b9740c7e5d90507f93

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

