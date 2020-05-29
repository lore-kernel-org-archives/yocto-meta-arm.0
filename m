Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web12.2956.1590776904108875950
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 May 2020 11:28:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=rcP9agAd;
 spf=pass (domain: linaro.org, ip: 209.85.214.195, mailfrom: ralph.siemsen@linaro.org)
Received: by mail-pl1-f195.google.com with SMTP id y11so1541340plt.12
        for <meta-arm@lists.yoctoproject.org>; Fri, 29 May 2020 11:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hOPqvxSQSRY+c4wVadE7TL7WJhZFjuJE36Y6+V+sz3Q=;
        b=rcP9agAdUK9ZIUAPbuFr55hiZ5oDbpAKDK6gSzg77Yhu6H8nY1Njo9DmsklsXihdSN
         3jOgMWomCL91fc/E2kYze0DkcoOvrmYAXNodyAdkZA0pFvBtdabHh6ScdgHdkeFHtwBE
         dlLdyKKPonhaXpbKvdfhp88k85OJtWgb7Bjnhe5hOxib9WOCkDrSEOsBVG+VRNAndvWu
         zcmIfU5Rn12Dkyy/OR1htyJB7/0WK4hLoHpSD+Z6ncaWxki6fmot3km73GX3M7mhPPZK
         W3SoXZ3XXIrDbVd9SpM28Srw+L3FOVCZc55C2qnh1R5cHRmIX8FFuaQcHZO3y59j7ywH
         2jkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hOPqvxSQSRY+c4wVadE7TL7WJhZFjuJE36Y6+V+sz3Q=;
        b=q0yPovSVH/Q7YtzBxTFCYBWcLPRaIpNiXtPnseoeHaaIaLrqjbfccPu0lnjNvnBvdM
         kF7xTKFCeLb42Qj9+EDwu1dPefRWHEqGDFumhDOBlwRpG0bS2RPbJhnv1Ff6XNziyS16
         ccL2BaqeOVODH9PiDAUqAcn8PSRyi3DNgYfRFlue3TKvN4oCXU80YgN8pifJylfQUc1y
         DnDGN4VTYSF6+pSqDHWlDrveSAUE8hwbGIXs0jN3+A4T66wJmW+hLuMXhn+MoEKtn0wH
         2Jfy8vKXuv9COGidsfptsTNMjn1jFuDRn0T/BCWF70o4C8Mi00UFHVcLXWCptzNMT5HY
         cx6Q==
X-Gm-Message-State: AOAM531KAGpYCFtGTxtL1140sQBA+hkbyYcoupIvKtLPlMoBTVd/IZxD
	vplaHP0UzBEYXFsoGZpvtOoCj6qUUuxhkkJHKaPE9Q==
X-Google-Smtp-Source: ABdhPJw2YV2nHTmJz3Hr5FVddbzUTjaYqVIKj4uN9a8krvBeC4xMhK13k3Ey2igAbytSH8omjjCnaPeo/yIzkgH44Ic=
X-Received: by 2002:a17:90a:db44:: with SMTP id u4mr4319134pjx.195.1590776903531;
 Fri, 29 May 2020 11:28:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200528140737.23411-1-ralph.siemsen@linaro.org>
 <CAFA6WYO4c3rHboqfppR+-h_Cjy7trTypfYm7Bikf6hVMy-jJUw@mail.gmail.com> <20200529142830.GA20456@kudzu.us>
In-Reply-To: <20200529142830.GA20456@kudzu.us>
From: "Ralph Siemsen" <ralph.siemsen@linaro.org>
Date: Fri, 29 May 2020 14:28:12 -0400
Message-ID: <CANp-EDbxdvHMh4nVYKzDaJ1foTYWV64WSnkcYjFsL+YRs2e3DQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] arm-toolchain: set CVE_VERSION to fix cve-check warnings
To: Jon Mason <jdmason@kudzu.us>
Cc: Sumit Garg <sumit.garg@linaro.org>, meta-arm@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000004092bd05a6cd9c34"

--0000000000004092bd05a6cd9c34
Content-Type: text/plain; charset="UTF-8"

Hi Jon,

On Fri, May 29, 2020 at 10:28 AM Jon Mason <jdmason@kudzu.us> wrote:

>
> Applied to the master branch.
>

Great, thank you.

What is the process for applying it to dunfell - should I send another
patch (only the subject line will differ)?

Regards
Ralph

--0000000000004092bd05a6cd9c34
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Jon,</div><div><br></div><div>On Fri, May 29, 2020=
 at 10:28 AM Jon Mason &lt;<a href=3D"mailto:jdmason@kudzu.us">jdmason@kudz=
u.us</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><br>
Applied to the master branch.<br></blockquote><div><br></div><div>Great, th=
ank you.</div><div><br></div><div>What is the process for applying it to du=
nfell - should I send another patch (only the subject line will differ)?</d=
iv><div><br></div><div>Regards<br>Ralph=C2=A0</div></div></div>

--0000000000004092bd05a6cd9c34--
