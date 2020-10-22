Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web10.11102.1603375430921246911
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 Oct 2020 07:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=RuLRQB8o;
 spf=pass (domain: burtonini.com, ip: 209.85.208.194, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f194.google.com with SMTP id 23so2052504ljv.7
        for <meta-arm@lists.yoctoproject.org>; Thu, 22 Oct 2020 07:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xcMama2jYfEpIHiauaJmtXooQvSUf8vC5+yMRBfSWMg=;
        b=RuLRQB8o31HT549wTdQ/Va6DFlttr4i/QfPurAdB6QjUczDpY/c6enIVCrpH9JCghQ
         gHoDuZ0hujurNMF33HNoG/rCNOInq3JRBHGOgyhoFRz0xAsYyKiLpHcrnLj4QEdR+bFK
         VWf3JjI8EDINm8pXMaPfcQGonSjdeL9F/bZ5vJsTsOblwwKvz2RlqsRZeyNfdfWOoF/h
         D9ny+Urijx48+/un1/CncHsqHbYbVjmTlkCl92TPs9MpPvRffd4+sVQ/C3kFgdgjzw5Z
         CxFC46jWxT0N+sqd57D8sJ2+7R3eNqNKH22apPSDs3UETTMJy5z/iXSKz3fY7D6dyjIN
         NG0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xcMama2jYfEpIHiauaJmtXooQvSUf8vC5+yMRBfSWMg=;
        b=g32CxrXAGMCml1HoDDRgheCanKHHm6cxcn18pe3CXqn2AD0LgyA+iGRNIcFtIdiIBL
         WZ0WjDB9NrTSgwbqL7QpejQnZ1khNVW3Tns5v46S1sNX5bPqLVT81PQ4YZ59jjgbeXil
         Es7nqXV+FGIVzyh/ImwX5Jis1ydCfTbIr5R7Dr3n5vi+a6FYapA5ip//SLmWQ6b7y7ux
         WBD8Je4oa/Aqy7//3qaLewyG5Htz7riuG+B/qbeIyJqWtL6euWRZLnVIGcnbWOBJKfd7
         E+4pELZBc5W4PhTBIyU4BBYNRpNn3NMh86roBXQtOheTn4mSt6YeqASKSj4McrscCjzf
         W96g==
X-Gm-Message-State: AOAM533HegZJ2whI/bQ9ykr9l6oCqnlICifD5gX654ZaeLxv17V3dL0u
	+X8232QW9wNVm6AqKI6HNZKHbR9jYsXuQrUP6a38VA==
X-Google-Smtp-Source: ABdhPJyb5i7xrkc5D1SxHaHiLKaoHk19WdQpNdXrqyLhwv9ll8drJJzWX8+1+3drdIXLNBldc3zv7xlVSRId9UdIgZE=
X-Received: by 2002:a2e:995a:: with SMTP id r26mr1005157ljj.329.1603375429073;
 Thu, 22 Oct 2020 07:03:49 -0700 (PDT)
MIME-Version: 1.0
References: <20201021171033.21198-1-abdellatif.elkhlifi@arm.com>
 <20201021172340.GF19155@denix.org> <CAAnfSTviL7v4i=YVO78ANwTH6859iKivy-Br+AQQXogtG_km9g@mail.gmail.com>
 <20201021185859.GG19155@denix.org>
In-Reply-To: <20201021185859.GG19155@denix.org>
From: "Ross Burton" <ross@burtonini.com>
Date: Thu, 22 Oct 2020 15:03:33 +0100
Message-ID: <CAAnfSTtRhQt_nFT4wbEOVT=p5Bqo3hiGAgKO9GCvN9Ph5sY1YA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] arm-bsp/corstone700-test-app: adding test recipe for systems comms
To: Denys Dmytriyenko <denis@denix.org>
Cc: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>, meta-arm@lists.yoctoproject.org, 
	Lakshmi.Kailasanathan@arm.com, Ross Burton <Ross.Burton@arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Oct 2020 at 19:59, Denys Dmytriyenko <denis@denix.org> wrote:

> Yeah, I know this is Debian convention for things like -rc1
>
> And OpenEmbedded convention for this case historically was 0.9+1.0-rc1

That was because historically we didn't have ~ support.  We do now.

Ross
