Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50E75FD530A
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 19:01:04 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.103877.1772218861862232034
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Feb 2026 11:01:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=PLpA5bHn;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.176, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8c6f21c2d81so233979185a.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 27 Feb 2026 11:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1772218861; x=1772823661; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mn72y5Er9sfhCjOGJP7Y1pA5tPBn8E1tVV9+Z1BvkKY=;
        b=PLpA5bHnrXIqKCGuK4wN32dXjPis21Qgtjj4wlTGWDQMJnzGpB+sv4B9+qLkwIobRe
         8Yeu/0dUMz5X5gdek4lYXTm2hKmc68AcbB/hZGi7urKqRrRGDqxuq+/FsVsDtL3BsSpB
         u0dIh0X2dFiH0+FYiv00R8+FeuHp7KSgX8m1H2OoPlWmUaJEEbU05j2Xn6VRYlm074ME
         ddT3IBBORYeOWPZcFeIq6WuPJvonz1rGtwRYTNpgnf0QcNkuRTuXkBzI7dviOsPQhvyj
         +QwuVMjlO6lU4j+ZbFiX82OefwLW/xz3Xm/sdGUey5U1KbIRIdxDiuQuaPuBiLmNTLGW
         +doQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772218861; x=1772823661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Mn72y5Er9sfhCjOGJP7Y1pA5tPBn8E1tVV9+Z1BvkKY=;
        b=Zb+guroxAa+uqaKberWMuvhv8TUzBYQcDb0tvNldtOH1FvZEA0dC2piyvDMinez9kz
         dKjhMKftaJyvT3lS0p1ReyiBQ66N+Q7Tlfr3RSgFZgWzfK2CqAlNuWwa34DvFMOwCc3N
         Ftpf8ztPjMlmqJ5QwQC6+esh0fMJg7fOtBPg37+8b4TOBrUUJNKvHg5OO7mqnNl81BEW
         D2PL2gWVxenULWPOKhnA9TGXLCGm+CG/h5rFBRifZoqSkrLK/zTnTaBWqa8isulZa2Cd
         UnHndKhm2DIh5qbWOsxfFUWhxvjze+irJ+0ZKgMiOXR9jdw3fOoHFEBTc29ZW20AXtSg
         UbRQ==
X-Gm-Message-State: AOJu0YyZr1mM3W7Nyn8ni6cvjdbzzdj110hLncwso0EhtK/dkGWV1wfp
	adH0ADnJyAj9fLwDB8xAcq1YWfC/kLq+ovD34czE8zjyaacwfVaA4jZpBmNb3XcYe8icryQQGKq
	EsS4=
X-Gm-Gg: ATEYQzxwjV82zmhdCyNgzsLqqLrk9AkMe7qF5JIPhHokKufprchr98Lwz4FY6fPOmXZ
	JfNLsHdbUo/cAcpPjVvudx7GLemEe+hFv++cPEhNdvyb7X4JCrpII1yu40IQParvzI5jcDLmA91
	p2SxKhMkKtOAMm1NLGzolxBDXVHdwd8zAIWO1rzgV31MZTkG3RkNVwqQ3MFlC/atQPeNHGidKqw
	UyOqH7mnJkxpk4Vksg0I5hxUB9VA92r3CRtcjrWb044XhgxHuaQ9zmCyeJVEmLCpE5xACkUhPUU
	p1h1uwwX3AE1af2B4RQLviLr4Pl8bVCCYm5hbr8brcElxI/sNZUF/xhb2erR9D3ge0RHjUBdo2K
	lu4rZxB3ufsq/w+IX61uMJzkRcQE53lmncLXPfkAfnwOhRuP6cquWGsHacCJDYxTH+9EfNW53X8
	yovccHTVpxzU59
X-Received: by 2002:a05:620a:bd3:b0:8c6:ff8f:58af with SMTP id af79cd13be357-8cbc8ef759emr515217785a.51.1772218860193;
        Fri, 27 Feb 2026 11:01:00 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf678156sm608848785a.18.2026.02.27.11.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 11:00:58 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm/edk2-firmware: Update to 202602
Date: Fri, 27 Feb 2026 14:00:39 -0500
Message-Id: <177221883995.575698.1192144975351500850.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260227140134.69088-1-jon.mason@arm.com>
References: <20260227140134.69088-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 27 Feb 2026 19:01:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6927


On Fri, 27 Feb 2026 09:01:34 -0500, Jon Mason wrote:
> Update edk2, edk2-platforms, and sbsa-acs to the latest versions/SHAs.
> A bleeding edge patch from upstream is needed to correct a build race in
> antlr, and the latest SHA for edk2-platforms is needed to work around
> some compilation issues with ENABLE_TPM in fvp-base.
> 
> 

Applied, thanks!

[1/1] arm/edk2-firmware: Update to 202602
      commit: 40d015d7800da9c466346f84cd90ab9cfd2ea882

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

